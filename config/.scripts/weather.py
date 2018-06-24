import sys
from os import stat
import time
from datetime import datetime

import requests
import json


def get_info():
    'Gather the City ID and API Key'
    # First line of the API file in the same directory as this file is the city ID
    # Second line of the API file in the same directory as this file is the openweathermap-API key
    try:
        with open('API', 'r') as f:
            city_id = f.readline().strip('\n')
            api_key = f.readline().strip('\n')
            if city_id == '' or api_key == '':
                raise FileNotFoundError
            return [city_id, api_key]
    except FileNotFoundError:
        print("Create a file called 'API' and put your city id in the 1st and API-key in the 2nd line.")


def cache_weather():
    'Cache the weatherinformation as json'
    city_id, api_key = get_info()
    url = 'http://api.openweathermap.org/data/2.5/forecast?id={}&APPID={}&units=metric'.format(city_id, api_key)
    ob_weather = requests.get(url).text
    with open('weather_cache.json','w') as f:
        json.dump(ob_weather, f)


# Isn't needed at the moment, might change later
def conv_to_epoch(iso_time):
    'Converts the dt_txt to epoch time(Or any ISO formatted timestamp)'
    dt_obj = datetime.strptime(iso_time, "%Y-%m-%d %H:%M:%S")
    return int(dt_obj.strftime("%s"))


def main():
    # Only request new data, when data is older than 12h
    # if (os.path.isfile('weather_chache.json')):
    #     if (time.time()-1800000>os.stat('weather_cache.json').st_mtime):
    #         cache_weather()
    # else:
    #     cache_weather()
    # Load cached file as dictionary
    weather = json.loads(json.load(open('weather_cache.json')))

    if(weather['cod']=='200'):
        lowest_temp = sys.maxsize
        lowest_time = ''
        # Only check the next 24h
        for i in weather['list']:
            print(i['dt_txt'])
            print(i['main']['temp'])
            print(i['weather']['main'])
            print(i['dt_txt'])
            print('Time: {} \nTemp: {}'.format(i['dt_txt'], i['main']['temp']))
            print('Time: {} \nDescription: {}'.format('\t', i['weather']['main']))


    else:
        print("Error.\nDo you have a working internet connection?\nIs your API Key correct?\nIs your city ID correct?")

if __name__ == '__main__':
    print(main())
