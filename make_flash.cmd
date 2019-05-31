@ECHO OFF
docker run -it --rm -v "%~dp0..:/esp/project" -w /esp/project esp32-idf bash -c "export PYTHONPATH=/esp/project/buildscripts:$PYTHONPATH && pushd /esp/esp-idf/components/esptool_py/esptool/ && git checkout v2.6 && patch -u esptool.py /esp/project/buildscripts/esptool.py.patch && popd && make -j8 all flash monitor"
