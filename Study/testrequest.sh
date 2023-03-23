#!/usr/bin/bash

json_data=$(curl http://httpbin.org/json)

echo $json_data | jq '.slideshow.author'

echo $json_data | jq '.slideshow.slides[0].title'
