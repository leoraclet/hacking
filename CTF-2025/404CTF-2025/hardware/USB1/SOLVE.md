# Solve USB

The key was

* to modify the sources of pulseview (decoders part writen in python)
  * To handle SYNC being different thant in standard
  * And so handle longer packet
* to modify sample rate to match 12 MHz per full-speed USB1.1 standards
