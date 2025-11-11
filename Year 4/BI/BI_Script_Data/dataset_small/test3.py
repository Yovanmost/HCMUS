import csv
from io import StringIO

d = {'DATE': '2015-04-26', 'AIRLINE': 'AA', 'FLIGHT_NUMBER': 309, 'TAIL_NUMBER': 'N3CVAA', 'ORIGIN_AIRPORT': 'LGA', 'DESTINATION_AIRPORT': 'ORD', 'SCHEDULED_DEPARTURE': 630, 'DEPARTURE_TIME': 626.0}

# preserve key order (dict preserves insertion order in Python 3.7+)
keys = list(d.keys())

# produce CSV line as string
output = StringIO()
writer = csv.writer(output)
writer.writerow(keys)       # write header if desired
writer.writerow([d[k] for k in keys])
csv_text = output.getvalue().strip()
print(csv_text)