#!/bin/bash
echo 65 | sudo tee /sys/devices/platform/applesmc.768/leds/smc::kbd_backlight/brightness > terminator
