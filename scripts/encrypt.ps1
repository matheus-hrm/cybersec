 #Encryption Key(16, 24 or 32 bytes)
 $encriptionKey=[Text.Encoding]::UTF8.GetBytes("MySecretEncryptionKey")

 #Text to encrypt
 $txt = "Hello World"
 
 #Convert the text to bytes
 $bytesToEncrypt=[Text.Encoding]::UTF8.GetBytes($txt)
 
 # Create AES encryption object
 $aes=[System.Security.Cryptography.Aes]::Create()
 $aes.Mode=[System.Security.Cryptography.CipherMode]::CBC
 $aes.Padding=[System.Security.Cryptography.PaddingMode]::PKCS7
 
 # Generate a random IV(Initialization Vector)
 $aes.GenerateIV()
 
 # Create an encryption stream
 $encryptor = $aes.CreateEncryptor()
 
 # Encrypt the bytes
 $encryptedBytes = $encryptor.TransformFinalBlock($bytesToEncrypt, 0, $bytesToEncrypt.Length)
 
 # Convert the encrypted bytes to Base64 for storage
 $encryptedText = [Convert]::ToBase64String($aes.IV  + $encryptedBytes)
 
 # Display the encrypted text
 Write-Host "Encrypted Text: $encryptedText"