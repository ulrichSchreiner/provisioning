#!/bin/sh

case "$1" in
    pre)
        # Ausschalten (funktioniert meist sofort)
        /usr/bin/curl -s "http://tasmota-03/cm?cmnd=Power+Off"
        ;;
    post)
        # Check: Wurde das Skript vom Suspend-Hook aufgerufen?
        # (Systemd-Hooks setzen oft Umgebungsvariablen, aber wir prüfen einfach,
        # ob wir im Hintergrund via systemd-run laufen müssen)

        if [ "$2" = "is_boot" ]; then
            # DIREKT ausführen beim Booten (Service wartet ja eh aufs Netz)
            /usr/bin/curl -s "http://tasmota-03/cm?cmnd=Power+On"
        else
            # RESUME: Entkoppelt im Hintergrund mit Verzögerung starten
            systemctl stop tasmota-resume-delay.service 2>/dev/null
            systemd-run --unit=tasmota-resume-delay \
                /usr/bin/bash -c "sleep 15 && /usr/bin/curl -s 'http://tasmota-03/cm?cmnd=Power+On'"
        fi
        ;;
esac