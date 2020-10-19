# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# I load some variables from variables.ps1
. C:\SessionRecording\Scripts\variables.ps1

# I wait until the user session is active.
while ($True) {
  $SessionActive = $False
  $Sessions = @(query session) -split '\n' | Select-Object -Skip 1
    
  foreach($Session in $Sessions) {
    $ParsedSession = $Session -split '\s{2,}'
    $SessionUserName = $ParsedSession[1]
    $SessionId = $ParsedSession[2]
    $SessionState = $ParsedSession[3]
    if ($SessionState -eq 'Active') {
      $SessionActive = $True
      Break
    }
  }

  if ($SessionActive) {
    Break
  }
  else {
    Start-Sleep -Seconds 1
  }
}

# When the sessions becomes active, I run script_b.ps1 as SYSTEM such that it can interacts with the user session. By doing so, I can capture the user session desktop, while preventing the user from killing the script.
C:\SessionRecording\Bin\PsExec64.exe -d -i $SessionId -s -accepteula C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe -NonInteractive -WindowStyle Hidden -File C:\SessionRecording\Scripts\script_b.ps1 -UserName $SessionUserName
