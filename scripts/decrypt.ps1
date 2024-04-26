   #Convert the Base64 encrypted text back to bytes
$encryptedBytesWithIV = [Convert]::FromBase64String($encryptedText)
$iv = $encryptedBytesWithIV[0..15]
$encryptedBytesOnly = $encryptedBytesWithIV[16..($encryptedBytesWithIV.Length - 1)]

# Set the IV and decrypt
$aes.IV = $iv
$decryptor = $aes.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytesOnly, 0, $encryptedBytesOnly.Length)

# Convert the decrypted bytes back to text
$decryptedText = [Text.Encoding]::UTF8.GetString($decryptedBytes)

# Display the decrypted text
Write-Host "Decrypted text: $decryptedText"