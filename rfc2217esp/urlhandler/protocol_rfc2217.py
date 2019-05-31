import serial.rfc2217

PURGE_FLASH = b'\x07' # Set the ESP in flash mode

class Serial(serial.rfc2217.Serial):

    def __init__(self, *args, **kwargs):
        super(Serial, self).__init__(*args, **kwargs)

    def flash_esp(self):
        if not self.is_open:
            raise portNotOpenError
        self.rfc2217_send_purge(PURGE_FLASH)
