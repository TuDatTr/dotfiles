#!/usr/bin/env nu

let filename = (date now | date format "%s")
while 1 == 1 {
    (sudo tlp-stat -b | grep Charge | split column '=' | str trim ) | insert a (date now | date format "%s") | reject column1 | rename Charge Timestamp | to csv -n | str replace " \\[%\\]" "" |save -a $"$filename".csv;
    sleep 50ms;
}
