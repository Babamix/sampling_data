#!/usr/bin/bash

#download in data folder
wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

#go to data folder
cd data

#separating csv
in2csv weather_data.xlsx --sheet "weather_2014" > weather_2014.csv
in2csv weather_data.xlsx --sheet "weather_2015" > weather_2015.csv

#stacking 2 csv
csvstack weather_2014.csv weather_2015.csv > weather.csv

#deleting xlsx data
rm weather_data.xlsx

#creating sample csv
cat weather.csv | sample -r 0.3 >> sample_weather.csv
