#!/bin/bash

# A simple script to send battery alerts.
# Requires libnotify.

# --- CONFIGURATION ---
# Set the battery identifier. Use `ls /sys/class/power_supply/` to find yours.
BATTERY="BAT0"

# Set percentage thresholds
WARNING_LEVEL=20
LOW_LEVEL=10
CRITICAL_LEVEL=5

# Set time between checks
SLEEP_INTERVAL=120 # in seconds

# --- SCRIPT LOGIC ---
# Use a temporary file to store the last notification level to avoid spamming.
STATE_FILE="/tmp/battery_notification_state"

# Initialize state if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "100" > "$STATE_FILE"
fi

while true; do
    CAPACITY=$(cat "/sys/class/power_supply/${BATTERY}/capacity")
    STATUS=$(cat "/sys/class/power_supply/${BATTERY}/status")
    LAST_NOTIFIED_LEVEL=$(cat "$STATE_FILE")

    if [ "$STATUS" = "Discharging" ]; then
        if [ "$CAPACITY" -le "$CRITICAL_LEVEL" ] && [ "$LAST_NOTIFIED_LEVEL" -gt "$CRITICAL_LEVEL" ]; then
            notify-send -u critical -i "battery-empty" "Battery Critically Low!" "Plug in your charger immediately. Battery at ${CAPACITY}%."
            echo "$CRITICAL_LEVEL" > "$STATE_FILE"
        elif [ "$CAPACITY" -le "$LOW_LEVEL" ] && [ "$LAST_NOTIFIED_LEVEL" -gt "$LOW_LEVEL" ]; then
            notify-send -u normal -i "battery-low" "Battery Low" "Your battery is at ${CAPACITY}%."
            echo "$LOW_LEVEL" > "$STATE_FILE"
        elif [ "$CAPACITY" -le "$WARNING_LEVEL" ] && [ "$LAST_NOTIFIED_LEVEL" -gt "$WARNING_LEVEL" ]; then
            notify-send -u low -i "battery-caution" "Battery Warning" "Your battery is at ${CAPACITY}%."
            echo "$WARNING_LEVEL" > "$STATE_FILE"
        fi
    elif [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
        # If the battery is charging or full, reset the state so we can get notified again if it unplugs.
        if [ "$LAST_NOTIFIED_LEVEL" -lt 100 ]; then
             echo "100" > "$STATE_FILE"
        fi
    fi

    sleep "$SLEEP_INTERVAL"
done
