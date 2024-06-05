$username = "user"
$password = "a"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))

$response = Invoke-RestMethod -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Uri "http://url/customState.json?showUnits=0&showColors=0"
$x = [string][Math]::Round($response.'dieselVolume(gallons)',0)
$y = [string][Math]::Round($response.'waterVolume(gallons)',0)

$z = [string][Math]::Round($response.'dieselLevel(mm)',0)
$d = [string][Math]::Round($response.'waterLevel(mm)',0)

write-output "
           <prtg>
           <result>
           <channel>dieselVolume(gallons)</channel>
           <value>$x</value>
           </result>
           <result>
           <channel>waterVolume(gallons)</channel>
           <value>$y</value>
           </result>
           <result>
           <channel>dieselLevel(mm)</channel>
           <value>$z</value>
           </result>
           <result>
           <channel>waterLevel(mm)</channel>
           <value>$d</value>
           </result>
           </prtg>
"

exit 0
