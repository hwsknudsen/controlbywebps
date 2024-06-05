$username = "user"
$password = "pw"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))

$response = Invoke-RestMethod -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Uri "http://url/customState.json?showUnits=0&showColors=0"
$int = [Math]::Round($response.'dieselVolume(gallons)',0)

$int2 = [Math]::Round($response.'waterVolume(gallons)',0)

$x=[string]$int+":OK"
$y=[string]$int
$z=[string]$int2

write-output "
           <prtg>
           <result>
           <channel>dieselVolume(gallons)</channel>
           <value>$y</value>
           </result>
           <result>
           <channel>waterVolume(gallons)</channel>
           <value>$z</value>
           </result>
           </prtg>
"

exit 0
