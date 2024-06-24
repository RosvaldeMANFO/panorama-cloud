#!/bin/sh

echo "window._env_ = {" > ./env-config.js

echo "API_URL: \"$API_URL\"," >> ./env-config.js

echo "}" >> ./env-config.js