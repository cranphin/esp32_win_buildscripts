@ECHO OFF
docker run -it --rm -v "%~dp0..:/project" -w /project espressif/idf bash -c "idf.py monitor -p rfc2217://host.docker.internal:2217"
