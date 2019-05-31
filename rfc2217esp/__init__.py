import serial

from .portmanager import PortManager

serial.protocol_handler_packages.remove("serial.urlhandler")
serial.protocol_handler_packages.append("rfc2217esp.urlhandler")
