@ECHO OFF
docker run -it --rm -v "%~dp0..:/project" -w /project espressif/idf bash -c "export PYTHONPATH=/project/buildscripts:$PYTHONPATH && pushd /opt/esp/idf/components/esptool_py/esptool/ && git checkout v2.6 && patch -u esptool.py /project/buildscripts/esptool.py.patch && popd && idf.py monitor"
