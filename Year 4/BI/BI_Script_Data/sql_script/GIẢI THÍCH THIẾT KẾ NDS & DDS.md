# GIẢI THÍCH THIẾT KẾ NDS & DDS

## 1. TỔNG QUAN KIẾN TRÚC

### Luồng dữ liệu:
```
CSV Files → Stage Tables → NDS (3NF) → DDS (Star Schema) → BI Dashboards
```

---

## 2. NDS - NORMALIZED DATA STORE (3NF)

### 2.1 Mục đích
- **Lưu trữ master data** đã được chuẩn hóa và làm sạch
- **Tích hợp dữ liệu** từ nhiều nguồn (staging)
- **Áp dụng SCD Type 2** để lưu lịch sử thay đổi
- **Data quality control** và business rules
- **Single source of truth** cho toàn hệ thống

### 2.2 Các bảng chính

#### **nds_Airlines (SCD Type 2)**
- **Mục đích**: Lưu thông tin hãng hàng không với lịch sử thay đổi
- **Business Key**: `AirlineCode`
- **SCD Type 2**: Nếu tên hãng thay đổi, tạo record mới với EffectiveDate mới
- **Use case**: Theo dõi merger, rebranding của hãng hàng không

#### **nds_Airports (SCD Type 2)**
- **Mục đích**: Master data của sân bay
- **Attributes**: Location, coordinates, city, state, country
- **SCD Type 2**: Theo dõi thay đổi tên sân bay, mở rộng

#### **nds_Aircraft**
- **Mục đích**: Quản lý thông tin máy bay theo Tail Number
- **Potential enrichment**: Loại máy bay, năm sản xuất, số ghế

#### **nds_CancellationReasons**
- **Reference data**: Bảng tra cứu nguyên nhân hủy chuyến
- **Mapping**: A=Airline, B=Weather, C=NAS, D=Security

#### **nds_FlightFacts** ⭐
- **Fact table trong NDS**: Lưu chi tiết từng chuyến bay
- **Foreign Keys**: Link tới các master tables
- **Pre-calculated columns**: 
  - `TotalDelayMinutes`: Tổng delay khi không hủy
  - `TotalTaxiTime`: Taxi Out + Taxi In
  - `IsOnTime`: Flag cho OTP calculation
  - `IsSevereDelay`: Flag cho severe delay analysis

### 2.3 Data Quality trong NDS
- **NULL handling**: Thay NULL bằng 0 cho các delay measures
- **Constraint validation**: FK constraints đảm bảo referential integrity
- **Audit trail**: LoadDate, SourceSystem tracking
- **SCD Type 2**: Maintain history cho master data

---

## 3. DDS - DIMENSIONAL DATA STORE (Star Schema)

### 3.1 Mục đích
- **OLAP optimization**: Thiết kế cho analytical queries
- **Denormalized**: Giảm JOINs, tăng query performance
- **User-friendly**: Business users dễ hiểu và query
- **Pre-aggregation**: Aggregate tables cho real-time dashboards

### 3.2 Dimension Tables

#### **dim_Date (Conformed Dimension)** ⭐
- **Mục đích**: Time intelligence cho mọi phân tích
- **Attributes**:
  - Day attributes: DayOfWeek, DayName, DayOfYear
  - Week attributes: WeekOfYear, WeekStartDate
  - Month attributes: Month, MonthName, MonthYear
  - Quarter attributes: Quarter, QuarterName
  - Year attributes: Year, FiscalYear
  - Business flags: IsWeekend, IsHoliday
  - Season: Spring/Summer/Fall/Winter

**Hỗ trợ nghiệp vụ**:
- **1.2.5**: Xu hướng OTP theo tháng/quý → GROUP BY MonthYear, QuarterName
- **1.2.8**: Delay trend theo mùa → GROUP BY Season
- Phân tích theo ngày trong tuần → DayOfWeek
- So sánh holiday vs non-holiday performance

#### **dim_Time** ⭐
- **Mục đích**: Phân tích theo giờ trong ngày
- **Grain**: Mỗi phút trong ngày (1440 records)
- **Attributes**:
  - Hour, Minute
  - **TimeBand**: Night (00-05), Morning (06-11), Afternoon (12-17), Evening (18-23)
  - IsBusinessHour: 06:00-18:00
  - IsPeakHour: 07-09, 17-19

**Hỗ trợ nghiệp vụ**:
- **1.2.9**: Delay theo khung giờ bay → GROUP BY TimeBand
- Phân tích peak hours
- Early morning vs late night performance

#### **dim_Airline**
- **Denormalized**: Chứa tất cả info về hãng
- **Enrichment potential**: AirlineType, FleetSize, Country
- **SCD Type 2**: Giữ nguyên history từ NDS

**Hỗ trợ nghiệp vụ**:
- So sánh performance giữa các hãng
- Rank airlines by OTP, delay, cancellation rate

#### **dim_Airport** ⭐
- **Rich attributes**:
  - Location hierarchy: City → State → Region → Country
  - Geographic: Latitude, Longitude
  - Classification: IsHub, TrafficCategory (High/Medium/Low)
  - Characteristics: TimeZone, Elevation, RunwayCount

**Hỗ trợ nghiệp vụ**:
- **1.2.6**: Top 5 sân bay bận rộn nhất
- **1.2.10**: Top sân bay delay nhiều nhất
- Phân tích theo region, hub vs non-hub
- Weather impact by elevation/location

#### **dim_Aircraft**
- Master data cho máy bay
- Potential analysis: Aircraft type performance, age impact

#### **dim_DelayCause**
- **Mục đích**: Phân loại nguyên nhân delay
- **Attributes**:
  - DelayCauseCode: AIR_SYSTEM, SECURITY, AIRLINE, LATE_AIRCRAFT, WEATHER
  - Category: Controllable vs Uncontrollable
  - ResponsibilityArea: Airline, ATC, Weather, Security

**Hỗ trợ nghiệp vụ**:
- **1.2.7**: Nguyên nhân gây trễ/hủy chính → Pareto analysis

#### **dim_CancellationReason**
- Reference data cho cancellation codes
- IsControllable flag for root cause analysis

### 3.3 Fact Tables

#### **fact_FlightPerformance (Transaction Grain)** ⭐⭐⭐
- **Grain**: Một row = một chuyến bay
- **Foreign Keys**: Links to ALL dimensions
- **Degenerate Dimensions**: FlightNumber, FlightDate (không tạo dimension riêng)

**Measures**:
- **Time measures**: Schedule vs Actual times
- **Delay measures**: Departure, Arrival, Total delays
- **Delay breakdown**: 5 loại delay (Air System, Security, Airline, Late Aircraft, Weather)
- **Ground operations**: Taxi Out/In, Wheels Off/On
- **Distance**: Miles flown

**Pre-calculated flags**:
- `OnTimePerformanceFlag`: |ArrivalDelay| < 5 phút
- `SevereDelayFlag`: ArrivalDelay > 15 phút
- `CancelledFlag`, `DivertedFlag`

**Hỗ trợ TẤT CẢ nghiệp vụ từ 1.2.1 → 1.2.12**

#### **fact_FlightDelayDetails (Bridge Table)**
- **Mục đích**: Unpivot delay causes thành rows riêng
- **Pattern**: One-to-many từ Flight → DelayCause
- **Use case**: Dễ dàng calculate contribution % của từng delay cause

**Ví dụ**:
```
FlightKey | DelayCauseKey | DelayMinutes
----------|---------------|-------------
1         | 1 (AIR_SYS)   | 27
1         | 3 (AIRLINE)   | 0
1         | 5 (WEATHER)   | 0
```

#### **fact_DailyAirportPerformance (Aggregate)** ⭐
- **Grain**: Airport + Day
- **Pre-aggregated metrics**:
  - TotalFlights, CancelledFlights, OnTimeFlights
  - AvgDepartureDelay, AvgArrivalDelay
  - OnTimePerformancePct, CancellationRate

**Lợi ích**:
- **Query performance**: Dashboard queries run on pre-aggregated data
- Không cần scan millions of transaction rows
- Daily refresh via ETL

**Hỗ trợ nghiệp vụ**:
- **1.2.6**: Top busiest airports
- **1.2.10**: Top delay airports
- Daily performance tracking

#### **fact_MonthlyAirlinePerformance (Aggregate)**
- **Grain**: Airline + Month
- **Use case**: Monthly reports, trend analysis
- **1.2.5**: OTP trend by month/quarter

---

## 4. ÁNH XẠ NGHIỆP VỤ VÀO THIẾT KẾ

### 4.1 Cấp 1 - Quản lý

#### **1.2.1: Tổng số chuyến bay**
```sql
-- DDS Query
SELECT COUNT(*) AS TotalFlights
FROM fact_FlightPerformance
WHERE DateKey BETWEEN @StartDateKey AND @EndDateKey;
```

#### **1.2.2: Tỷ lệ đúng giờ (OTP%)**
```sql
SELECT 
    SUM(CASE WHEN OnTimePerformanceFlag = 1 THEN 1 ELSE 0 END) * 100.0 / 
    SUM(CASE WHEN CancelledFlag = 0 THEN 1 ELSE 0 END) AS OTP_Percent
FROM fact_FlightPerformance
WHERE DateKey BETWEEN @StartDateKey AND @EndDateKey;
```

#### **1.2.3: Tỷ lệ hủy chuyến**
```sql
SELECT 
    SUM(CASE WHEN CancelledFlag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS CancellationRate
FROM fact_FlightPerformance
WHERE DateKey BETWEEN @StartDateKey AND @EndDateKey;
```

#### **1.2.4: Tỷ lệ trễ nghiêm trọng**
```sql
SELECT 
    SUM(CASE WHEN SevereDelayFlag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS SevereDelayRate
FROM fact_FlightPerformance
WHERE DateKey BETWEEN @StartDateKey AND @EndDateKey;
```

#### **1.2.5: Xu hướng OTP theo tháng/quý**
```sql
SELECT 
    d.MonthYear,
    d.QuarterName,
    AVG(CASE WHEN OnTimePerformanceFlag = 1 THEN 100.0 ELSE 0 END) AS AvgOTP
FROM fact_FlightPerformance f
JOIN dim_Date d ON f.DateKey = d.DateKey
WHERE d.Year = 2015
GROUP BY d.MonthYear, d.QuarterName, d.Month
ORDER BY d.Month;
```

**Hoặc dùng aggregate table**:
```sql
SELECT 
    YearMonth,
    OnTimePerformancePct
FROM fact_MonthlyAirlinePerformance
ORDER BY YearMonth;
```

#### **1.2.6: Top 5 sân bay bận rộn nhất**
```sql
-- Using pre-aggregated table (FAST)
SELECT TOP 5
    ap.AirportName,
    ap.CityName,
    SUM(dp.TotalFlights) AS TotalTraffic
FROM fact_DailyAirportPerformance dp
JOIN dim_Airport ap ON dp.AirportKey = ap.AirportKey
JOIN dim_Date d ON dp.DateKey = d.DateKey
WHERE d.Year = 2015
GROUP BY ap.AirportName, ap.CityName
ORDER BY TotalTraffic DESC;

-- Or count from transaction table (more flexible)
SELECT TOP 5
    ap.AirportName,
    COUNT(*) AS TotalFlights
FROM fact_FlightPerformance f
JOIN dim_Airport ap ON f.OriginAirportKey = ap.AirportKey -- or DestinationAirportKey
WHERE f.DateKey BETWEEN @StartDateKey AND @EndDateKey
GROUP BY ap.AirportName
ORDER BY TotalFlights DESC;
```

### 4.2 Cấp 2 - Nguyên nhân, Hiệu quả

#### **1.2.7: Nguyên nhân gây trễ/hủy chính**
```sql
-- Using bridge table
SELECT 
    dc.DelayCauseName,
    dc.ResponsibilityArea,
    SUM(fdd.DelayMinutes) AS TotalDelayMinutes,
    SUM(fdd.DelayMinutes) * 100.0 / (SELECT SUM(DelayMinutes) FROM fact_FlightDelayDetails) AS PercentageOfTotalDelay
FROM fact_FlightDelayDetails fdd
JOIN dim_DelayCause dc ON fdd.DelayCauseKey = dc.DelayCauseKey
JOIN fact_FlightPerformance f ON fdd.FlightKey = f.FlightKey
WHERE f.DateKey BETWEEN @StartDateKey AND @EndDateKey
GROUP BY dc.DelayCauseName, dc.ResponsibilityArea
ORDER BY TotalDelayMinutes DESC;

-- Or query directly from fact table
SELECT 
    'Air System' AS Cause,
    SUM(AirSystemDelayMinutes) AS TotalMinutes,
    SUM(AirSystemDelayMinutes) * 100.0 / SUM(TotalDelayMinutes) AS Percentage
FROM fact_FlightPerformance
WHERE TotalDelayMinutes > 0
UNION ALL
SELECT 'Weather', SUM(WeatherDelayMinutes), 
    SUM(WeatherDelayMinutes) * 100.0 / SUM(TotalDelayMinutes)
FROM fact_FlightPerformance
WHERE TotalDelayMinutes > 0
-- ... repeat for other causes
ORDER BY TotalMinutes DESC;
```

#### **1.2.8: Xu hướng delay theo tháng/mùa**
```sql
SELECT 
    d.MonthName,
    d.Season,
    AVG(f.ArrivalDelayMinutes) AS AvgDelayMinutes
FROM fact_FlightPerformance f
JOIN dim_Date d ON f.DateKey = d.DateKey
WHERE f.CancelledFlag = 0 
  AND f.ArrivalDelayMinutes > 0
GROUP BY d.Month, d.MonthName, d.Season
ORDER BY d.Month;
```

#### **1.2.9: Delay theo khung giờ bay**
```sql
SELECT 
    t.TimeBand,
    t.TimeBandSort,
    AVG(f.ArrivalDelayMinutes) AS AvgDelay,
    COUNT(*) AS FlightCount
FROM fact_FlightPerformance f
JOIN dim_Time t ON f.ScheduledDepartureTimeKey = t.TimeKey
WHERE f.CancelledFlag = 0
GROUP BY t.TimeBand, t.TimeBandSort
ORDER BY t.TimeBandSort;
```

#### **1.2.10: Top sân bay delay nhiều nhất**
```sql
SELECT TOP 10
    ap.AirportName,
    ap.CityName,
    ap.StateName,
    SUM(f.ArrivalDelayMinutes) AS TotalDelayMinutes,
    COUNT(*) AS DelayedFlights,
    AVG(f.ArrivalDelayMinutes) AS AvgDelay
FROM fact_FlightPerformance f
JOIN dim_Airport ap ON f.OriginAirportKey = ap.AirportKey
WHERE f.ArrivalDelayMinutes > 0
GROUP BY ap.AirportName, ap.CityName, ap.StateName
ORDER BY TotalDelayMinutes DESC;
```

#### **1.2.11: Thời gian xử lý mặt đất trung bình**
```sql
SELECT 
    ap.AirportName,
    AVG(f.TotalTaxiMinutes) AS AvgTaxiTime,
    AVG(f.TaxiOutMinutes) AS AvgTaxiOut,
    AVG(f.TaxiInMinutes) AS AvgTaxiIn
FROM fact_FlightPerformance f
JOIN dim_Airport ap ON f.OriginAirportKey = ap.AirportKey
WHERE f.TotalTaxiMinutes IS NOT NULL
GROUP BY ap.AirportName
ORDER BY AvgTaxiTime DESC;
```

#### **1.2.12: Trung bình thời gian delay**
```sql
SELECT 
    AVG(ArrivalDelayMinutes) AS AvgDelayTime
FROM fact_FlightPerformance
WHERE CancelledFlag = 0 
  AND ArrivalDelayMinutes > 0
  AND DateKey BETWEEN @StartDateKey AND @EndDateKey;
```

---

## 5. THIẾT KẾ NÂNG CAO

### 5.1 Columnstore Index
```sql
CREATE COLUMNSTORE INDEX IX_FlightPerformance_ColumnStore 
ON fact_FlightPerformance 
(
    DateKey, AirlineKey, OriginAirportKey, DestinationAirportKey,
    DepartureDelayMinutes, ArrivalDelayMinutes, TotalDelayMinutes,
    OnTimePerformanceFlag, SevereDelayFlag, CancelledFlag
);
```
- **Lợi ích**: 10-100x faster cho aggregate queries
- **Use case**: Dashboard queries với millions of rows

### 5.2 Partitioning Strategy
```sql
-- Partition fact table by Year
CREATE PARTITION FUNCTION PF_Year(INT)
AS RANGE RIGHT FOR VALUES (20150101, 20160101, 20170101);

CREATE PARTITION SCHEME PS_Year
AS PARTITION PF_Year ALL TO ([PRIMARY]);

-- Apply to fact table
CREATE TABLE fact_FlightPerformance (
    ...
) ON PS_Year(DateKey);
```
- **Lợi ích**: Query pruning, faster loads, easier maintenance

### 5.3 Slowly Changing Dimensions (SCD Type 2)
- **Airlines**: Tracking mergers, rebranding
- **Airports**: Name changes, expansions
- **Implementation**: EffectiveDate, ExpiryDate, IsCurrent

**Query pattern**:
```sql
-- Get current airline info
SELECT * FROM dim_Airline WHERE IsCurrent = 1;

-- Get airline info as of specific date
SELECT * FROM dim_Airline 
WHERE AirlineCode = 'AA' 
  AND @QueryDate BETWEEN EffectiveDate AND ISNULL(ExpiryDate, '9999-12-31');
```

---

## 6. TÓM TẮT ĐIỂM MẠNH

### NDS (3NF)
✅ Single source of truth  
✅ Data integrity via FK constraints  
✅ SCD Type 2 for history tracking  
✅ Normalized for data quality  
✅ Extensible for new sources  

### DDS (Star Schema)
✅ Query performance via denormalization  
✅ User-friendly for business users  
✅ Conformed dimensions  
✅ Pre-aggregated facts  
✅ Rich dimensional attributes  
✅ Supports all 12 business KPIs  

### Bridge Pattern
✅ Flexible delay cause analysis  
✅ Easy percentage calculations  
✅ Supports drill-down queries  

### Aggregate Tables
✅ Sub-second dashboard queries  
✅ Reduced resource consumption  
✅ Pre-calculated KPIs  

---

## 7. KẾ HOẠCH ETL

```
Stage → NDS:
- Data cleansing (NULL handling, data types)
- Business rule application
- SCD Type 2 logic
- Referential integrity checks

NDS → DDS:
- Dimension lookups
- Surrogate key mapping
- Measure calculations
- Aggregate table updates
- Incremental loads based on LoadDate
```