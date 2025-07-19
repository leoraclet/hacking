$first_bytes = @(42, 17, 99, 84, 63, 19, 88, 7, 31, 55, 91, 12, 33, 20, 75, 11)
Write-Host $env:USERNAME;
$usernameLen = ($env:USERNAME).Length
Write-Host $usernameLen;

$input_password = Read-Host -Prompt "Veuillez entrer le mot de passe pour faire dcoller la fuse"

$first_array = @()
    for ($i = 0; $i -lt $input_password.Length; $i++) {
        $char_number = [int][char]$input_password[$i]
        Write-Host $char_number;
        $xored_value = (($char_number -bxor $first_bytes[$i]) - $usernameLen) % 169
        Write-Host $xored_value;
        if ($xored_value -lt 0)
        {
            Write-Host "xored_value < 0";
            $xored_value += 169
        }
        $first_array += $xored_value
    }

    $res_array = @(93, 72, 28, 24, 67, 23, 98, 58, 35, 75, 98, 87, 68, 30, 97, 33)

$is_password_valid = $true
for ($i = 0; $i -lt $res_array.Length; $i++) {
    if ($res_array[$i] -ne $first_array[$i]) {
        $is_password_valid = $false
        break
    }
}

# if ($is_password_valid) {
#     $array_of_tuples = @((130,100),(262,100),(330,100),(392,100),(523,100),(660,100),(784,300),(660,300),(146,100),(262,100),(311,100),(415,100),(523,100),(622,100),(831,300),(622,300),(155,100),(294,100),(349,100),(466,100),(588,100),(699,100),(933,300),(933,100),(933,100),(933,100),(1047,400))
#     foreach ($N in $array_of_tuples) { [Console]::Beep($N[0],$N[1]) }
#     Write-Host "Mot de passe correct ! La fuse s'envoleeee !" -ForegroundColor Green
# } else {
#     $7d2001d954134742914aa6731ec558e2 = New-Object -com wscript.shell; 1..50 | % { $7d2001d954134742914aa6731ec558e2.SendKeys([char]175) };
#     $09fefe8428234a6da050e9c186a8132c = @(
#     @{ Pitch = 1059.274; Length = 300; };
#     @{ Pitch = 1059.274; Length = 200; };
#     @{ Pitch = 1188.995; Length = 500; };
#     @{ Pitch = 1059.274; Length = 500; };
#     @{ Pitch = 1413.961; Length = 500; };
#     @{ Pitch = 1334.601; Length = 950; };

#     @{ Pitch = 1059.274; Length = 300; };
#     @{ Pitch = 1059.274; Length = 200; };
#     @{ Pitch = 1188.995; Length = 500; };
#     @{ Pitch = 1059.274; Length = 500; };
#     @{ Pitch = 1587.117; Length = 500; };
#     @{ Pitch = 1413.961; Length = 950; };

#     @{ Pitch = 1059.274; Length = 300; };
#     @{ Pitch = 1059.274; Length = 200; };
#     @{ Pitch = 2118.547; Length = 500; };
#     @{ Pitch = 1781.479; Length = 500; };
#     @{ Pitch = 1413.961; Length = 500; };
#     @{ Pitch = 1334.601; Length = 500; };
#     @{ Pitch = 1188.995; Length = 500; };
#     @{ Pitch = 1887.411; Length = 300; };
#     @{ Pitch = 1887.411; Length = 200; };
#     @{ Pitch = 1781.479; Length = 500; };
#     @{ Pitch = 1413.961; Length = 500; };
#     @{ Pitch = 1587.117; Length = 500; };
#     @{ Pitch = 1413.961; Length = 900; };
#     );

#     foreach ($Beep in $09fefe8428234a6da050e9c186a8132c) {
#         [System.Console]::Beep($Beep['Pitch'], $Beep['Length']);
#     }
#     Function Invoke-TextToSpeech($Text) { Add-Type -AssemblyName System.speech; $0b208177d5aa47c79e1f785faa9ae70b = New-Object System.Speech.Synthesis.SpeechSynthesizer; $0b208177d5aa47c79e1f785faa9ae70b.Speak($Text) }
#     Invoke-TextToSpeech "$([char]([byte]0x42)+[char]([byte]0x6F)+[char]([byte]0x6F)+[char]([byte]0x6D))"
#     Write-Host "Mot de passe incorrect. La fuse vient d'exploser" -ForegroundColor Red
#     (Add-Type "$(
# [char]0x5B+[char]0x44+[char]0x6C+[char]0x6C+[char]0x49+[char]0x6D+[char]0x70+[char]0x6F+[char]0x72+[char]0x74+
# [char]0x28+[char]0x22+[char]0x75+[char]0x73+[char]0x65+[char]0x72+[char]0x33+[char]0x32+[char]0x2E+[char]0x64+
# [char]0x6C+[char]0x6C+[char]0x22+[char]0x29+[char]0x5D+[char]0x70+[char]0x75+[char]0x62+[char]0x6C+[char]0x69+
# [char]0x63+[char]0x20+[char]0x73+[char]0x74+[char]0x61+[char]0x74+[char]0x69+[char]0x63+[char]0x20+[char]0x65+
# [char]0x78+[char]0x74+[char]0x65+[char]0x72+[char]0x6E+[char]0x20+[char]0x69+[char]0x6E+[char]0x74+[char]0x20+
# [char]0x53+[char]0x65+[char]0x6E+[char]0x64+[char]0x4D+[char]0x65+[char]0x73+[char]0x73+[char]0x61+[char]0x67+
# [char]0x65+[char]0x28+[char]0x69+[char]0x6E+[char]0x74+[char]0x20+[char]0x68+[char]0x57+[char]0x6E+[char]0x64+
# [char]0x2C+[char]0x20+[char]0x69+[char]0x6E+[char]0x74+[char]0x20+[char]0x68+[char]0x4D+[char]0x73+[char]0x67+
# [char]0x2C+[char]0x20+[char]0x69+[char]0x6E+[char]0x74+[char]0x20+[char]0x77+[char]0x50+[char]0x61+[char]0x72+
# [char]0x61+[char]0x6D+[char]0x2C+[char]0x20+[char]0x69+[char]0x6E+[char]0x74+[char]0x20+[char]0x6C+[char]0x50+
# [char]0x61+[char]0x72+[char]0x61+[char]0x6D+[char]0x29+[char]0x3B
# )" -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
# }