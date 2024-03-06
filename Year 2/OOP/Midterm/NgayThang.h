#ifndef NGAYTHANG_H
#define NGAYTHANG_H

#pragma once

class NgayThang{
private:
    int ngay;
    int thang;
    int nam;
public:
    NgayThang();
    NgayThang(int ngay);
    NgayThang(int ngay, int thang);
    NgayThang(int ngay, int thang, int nam);

    


    ~NgayThang();
};

#endif