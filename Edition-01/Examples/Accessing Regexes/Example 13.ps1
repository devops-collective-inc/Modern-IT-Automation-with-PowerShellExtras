$SampleLog = 'Sample.log'

@'
[2020-07-16T19:35:46] [DEBUG] Connections waiting on [1508]:443
[2020-07-16T19:42:24] [ERROR] Disk space critical on /dev/sdb2
[2020-07-16T20:20:52] [WARN ] Service [2412] stopped <1min post-run
[2020-07-16T20:21:09] [INFO ] Service [2896] stopped
[2020-07-16T20:25:26] [DEBUG] Service [2896] ready
[2021-03-22T21:20:06] [ERROR] Service [2952] stopped unexpectedly
[2021-03-22T21:20:23] [INFO ] Closed [1663]:443
'@ | Out-File $SampleLog

Get-Content $SampleLog | Select-String '\[(?:ERROR|WARN )\]'
