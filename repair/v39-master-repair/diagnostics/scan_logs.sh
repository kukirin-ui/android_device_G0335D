#!/usr/bin/env bash
# Usage: ./scan_logs.sh logcat.txt [additional logs...]
set -u
if [ "$#" -lt 1 ]; then echo "Usage: $0 <log-file> [additional-log-files...]" >&2; exit 2; fi
for file in "$@"; do
  [ -f "$file" ] || { echo "SKIP: missing file: $file"; continue; }
  echo "===== $file ====="
  grep -Ein 'setgroups failed|Discarded .*invalid supplementary GID|Failed to load WiFi driver|wlan.*(fail|error)|qca_cld.*(fail|error)|/dev/goodix_fp|Fp::connect failed|fingerprint.*(unknown error|failed)|Bluetooth.*(enable timeout|ANR)|ANR in com.android.bluetooth|usb hal service not found|audio_effects.xml.*(parse|error)|acdb_loader_init_v3|Amplifier initialization failed|libjni_latinimegoogle.so|UnsatisfiedLinkError|avc: denied' "$file" || true
done
