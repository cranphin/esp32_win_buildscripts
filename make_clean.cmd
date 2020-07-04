@ECHO OFF
docker run -it --rm -v "%~dp0..:/project" -w /project espressif/idf bash -c "idf.py fullclean && rm sdkconfig && idf.py reconfigure"
