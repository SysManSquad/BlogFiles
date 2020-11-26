# List of Status Filter Rules variables


## Properties of the Status Message

| Variable name | Description   |
| ------------- | ------------- |
| %msgsc | Site code that reported the message |
| %msgsys | Name of the computer that reported the message |
| %msgsrc | Source that reported the message ("SMS Server", for example) |
| %msgcomp | Component that reported the message |
| %msgpid | Process ID of the process that reported the message |
| %msgtid | Thread ID of the thread of the process that reported the message |
| %msgtype | One character message type: A is Audit, M is Milestone, D is Detail, N is NT Event |
| %msgsev | One character message severity: E is Error, W is Warning, I is Informational |
| %msgid | Message ID of the message |
| %msgdesc | Complete message description text |
| %msgis01 | First "insertion string" |
| %msgis02 | Second "insertion string" |
| %msgis03 | Third "insertion string" |
| %msgis04 | Fourth "insertion string" |
| %msgis05 | Fifth "insertion string" |
| %msgis06 | Sixth "insertion string" |
| %msgis07 | Seventh "insertion string" |
| %msgis08 | Eighth "insertion string" |
| %msgis09 | Ninth "insertion string" |
| %msgis10 | Tenth "insertion string" |
| %msglta | Time the message was reported, converted to local time: Abbreviated weekday name |
| %msgltA | Time the message was reported, converted to local time: Full weekday name |
| %msgltb | Time the message was reported, converted to local time: Abbreviated month name |
| %msgltB | Time the message was reported, converted to local time: Full month name |
| %msgltd | Time the message was reported, converted to local time: Day of month as decimal number (01 – 31) |
| %msgltH | Time the message was reported, converted to local time: Hour in 24-hour format (00 – 23) |
| %msgltI | Time the message was reported, converted to local time: Hour in 12-hour format (01 – 12) |
| %msgltj | Time the message was reported, converted to local time: Day of year as decimal number (001 – 366) |
| %msgltm | Time the message was reported, converted to local time: Month as decimal number (01 – 12) |
| %msgltM | Time the message was reported, converted to local time: Minute as decimal number (00 – 59) |
| %msgltp | Time the message was reported, converted to local time: Current locale's A.M./P.M. indicator for 12-hour clock |
| %msgltS | Time the message was reported, converted to local time: Second as decimal number (00 – 59) |
| %msgltU | Time the message was reported, converted to local time: Week of year as decimal number, with Sunday as first day of week (00 – 51) |
| %msgltw | Time the message was reported, converted to local time: Weekday as decimal number (0 – 6; Sunday is 0) |
| %msgltW | Time the message was reported, converted to local time: Week of year as decimal number, with Monday as first day of week (00 – 51) |
| %msglty | Time the message was reported, converted to local time: Year without century, as decimal number (00 – 99) |
| %msgltY | Time the message was reported, converted to local time: Year with century, as decimal number |
| %msgltZ | Time the message was reported, converted to local time: Time-zone name or abbreviation; no characters if time zone is unknown |
| %msggmta | Time the message was reported, converted to GMT: Abbreviated weekday name |
| %msggmtA | Time the message was reported, converted to GMT: Full weekday name |
| %msggmtb | Time the message was reported, converted to GMT: Abbreviated month name |
| %msggmtB | Time the message was reported, converted to GMT: Full month name |
| %msggmtd | Time the message was reported, converted to GMT: Day of month as decimal number (01 – 31) |
| %msggmtH | Time the message was reported, converted to GMT: Hour in 24-hour format (00 – 23) |
| %msggmtI | Time the message was reported, converted to GMT: Hour in 12-hour format (01 – 12) |
| %msggmtj | Time the message was reported, converted to GMT: Day of year as decimal number (001 – 366) |
| %msggmtm | Time the message was reported, converted to GMT: Month as decimal number (01 – 12) |
| %msggmtM | Time the message was reported, converted to GMT: Minute as decimal number (00 – 59) |
| %msggmtp | Time the message was reported, converted to GMT: Current locale's A.M./P.M. indicator for 12-hour clock |
| %msggmtS | Time the message was reported, converted to GMT: Second as decimal number (00 – 59) |
| %msggmtU | Time the message was reported, converted to GMT: Week of year as decimal number, with Sunday as first day of week (00 – 51) |
| %msggmtw | Time the message was reported, converted to GMT: Weekday as decimal number (0 – 6; Sunday is 0) |
| %msggmtW | Time the message was reported, converted to GMT: Week of year as decimal number, with Monday as first day of week (00 – 51) |
| %msggmty | Time the message was reported, converted to GMT: Year without century, as decimal number (00 – 99) |
| %msggmtY | Time the message was reported, converted to GMT: Year with century, as decimal number |

## Properties of the Current Site
| Variable name | Description   |
| ------------- | ------------- |
|%%|% character
|%sc|site code of the current site|
|%parentsc|site code of the parent site|
|%sitesvr|name of the site server for the current site|
|%sqlsvr|name of the SQL server for the current site|

## Current Time
| Variable name | Description   |
| ------------- | ------------- |
| %lta | Current local time: Abbreviated weekday name |
| %ltA | Current local time: Full weekday name |
| %ltb | Current local time: Abbreviated month name |
| %ltB | Current local time: Full month name |
| %ltd | Current local time: Day of month as decimal number (01 – 31) |
| %ltH | Current local time: Hour in 24-hour format (00 – 23) |
| %ltI | Current local time: Hour in 12-hour format (01 – 12) |
| %ltj | Current local time: Day of year as decimal number (001 – 366) |
| %ltm | Current local time: Month as decimal number (01 – 12) |
| %ltM | Current local time: Minute as decimal number (00 – 59) |
| %ltp | Current local time: Current locale's A.M./P.M. indicator for 12-hour clock |
| %ltS | Current local time: Second as decimal number (00 – 59) |
| %ltU | Current local time: Week of year as decimal number, with Sunday as first day of week (00 – 51) |
| %ltw | Current local time: Weekday as decimal number (0 – 6; Sunday is 0) |
| %ltW | Current local time: Week of year as decimal number, with Monday as first day of week (00 – 51) |
| %lty | Current local time: Year without century, as decimal number (00 – 99) |
| %ltY | Current local time: Year with century, as decimal number |
| %ltZ | Current local time: Time-zone name or abbreviation; no characters if time zone is unknown |
| %gmta | Current GMT time: Abbreviated weekday name |
| %gmtA | Current GMT time: Full weekday name |
| %gmtb | Current GMT time: Abbreviated month name |
| %gmtB | Current GMT time: Full month name |
| %gmtd | Current GMT time: Day of month as decimal number (01 – 31) |
| %gmtH | Current GMT time: Hour in 24-hour format (00 – 23) |
| %gmtI | Current GMT time: Hour in 12-hour format (01 – 12) |
| %gmtj | Current GMT time: Day of year as decimal number (001 – 366) |
| %gmtm | Current GMT time: Month as decimal number (01 – 12) |
| %gmtM | Current GMT time: Minute as decimal number (00 – 59) |
| %gmtp | Current GMT time: Current locale's A.M./P.M. indicator for 12-hour clock |
| %gmtS | Current GMT time: Second as decimal number (00 – 59) |
| %gmtU | Current GMT time: Week of year as decimal number, with Sunday as first day of week (00 – 51) |
| %gmtw | Current GMT time: Weekday as decimal number (0 – 6; Sunday is 0) |
| %gmtW | Current GMT time: Week of year as decimal number, with Monday as first day of week (00 – 51) |
| %gmty | Current GMT time: Year without century, as decimal number (00 – 99) |
|%gmtY|Current GMT time: Year with century, as decimal number|