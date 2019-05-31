import serial.rfc2217
import time

PURGE_FLASH = b'\x07' # Set the ESP in flash mode

class PortManager(serial.rfc2217.PortManager):

    def __init__(self, serial_port, connection, logger=None):
        super(PortManager, self).__init__(serial_port, connection, logger)

    def _setDTR(self, state):
        self.serial.setDTR(state)

    def _setRTS(self, state):
        self.serial.setRTS(state)
        # Work-around for adapters on Windows using the usbser.sys driver:
        # generate a dummy change to DTR so that the set-control-line-state
        # request is sent with the updated RTS state and the same DTR state
        self.serial.setDTR(self.serial.dtr)

    def _telnet_process_subnegotiation(self, suboption):
        if suboption[0:1] == serial.rfc2217.COM_PORT_OPTION and suboption[1:2] == serial.rfc2217.PURGE_DATA and suboption[2:3] == PURGE_FLASH:
            if self.logger:
                self.logger.info("Set ESP to flash mode")

            self._setDTR(False)  # IO0=HIGH
            self._setRTS(True)   # EN=LOW, chip in reset
            time.sleep(0.1)
            self._setDTR(True)   # IO0=LOW
            self._setRTS(False)  # EN=HIGH, chip out of reset
            time.sleep(0.05)
            self._setDTR(False)  # IO0=HIGH, done

            self.rfc2217_send_subnegotiation(serial.rfc2217.SERVER_PURGE_DATA, PURGE_FLASH)
                
        else:
            super(PortManager, self)._telnet_process_subnegotiation(suboption)
