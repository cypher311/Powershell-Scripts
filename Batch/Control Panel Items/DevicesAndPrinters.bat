@echo off
echo Running Devices and Printers as Admin....
echo
runas /u:cci\gboeshart "control /name Microsoft.DevicesAndPrinters"