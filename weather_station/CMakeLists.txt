cmake_minimum_required(VERSION 3.13)
project(WeatherStation CXX)

file(GLOB_RECURSE WEATHER_STATION_SRC "src/*.cpp")
list(FILTER WEATHER_STATION_SRC EXCLUDE REGEX ".*_test.cpp")

# Add library sources
add_executable(WeatherStation ${WEATHER_STATION_SRC})
