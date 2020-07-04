@ECHO OFF
docker run -it --rm -v "%~dp0..:/project" -w /project espressif/idf bash -c "rm -rf /project/sdk && mkdir /project/sdk && cd /opt/esp && find idf tools/xtensa-esp32-elf \( -path idf/examples -o -path idf/tools \) -prune -o -type f \( -name '*.cpp' -o -name '*.c' -o -name '*.h' -o -name '*.tcc' -o -name '*.hpp' -o -path '*/include/*' \) -print | tar -czO -T - | tar -xvz -C /project/sdk"
