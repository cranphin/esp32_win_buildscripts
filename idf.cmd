@ECHO OFF
docker run -it --rm -v "%~dp0..:/esp/project" -w /esp/project esp32-idf bash
