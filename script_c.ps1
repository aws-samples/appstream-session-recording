# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

Set-Content -Path C:\SessionRecording\Scripts\ended.txt -Value "ended"

while ((Test-Path -Path C:\SessionRecording\Scripts\ended.txt)) {
  Start-Sleep -Seconds 1
}