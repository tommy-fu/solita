from datetime import datetime
url = 'https://gbfs.citibikenyc.com/gbfs/en/station_status.json'
today = datetime.now()
dt_string = today.strftime("%Y-%m-%dT%H:%M:%S")
filename = url.split('/')[-1].split('.')
test = f"{filename[0]}_{dt_string}.{filename[1]}"
print(test)
filepath = f"citibike-case-tripdata/stations_status/{test}"
print(filepath)

# import urllib3
# http = urllib3.PoolManager()
# r = http.request('GET', 'https://gbfs.citibikenyc.com/gbfs/en/station_status.json')
# print(r.data.decode('ascii'))
# with open('test4.json', 'w') as f:
#     f.write(r.data.decode('ascii'))




