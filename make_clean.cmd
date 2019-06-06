@ECHO OFF
docker run -it --rm -v "%~dp0..:/esp/project" -w /esp/project cranphin/esp32-idf bash -c "rm -rf build && rm sdkconfig && make defconfig && make -j8 clean"
