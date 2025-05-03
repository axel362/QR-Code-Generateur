@echo off
cls
echo Entrez une URL pour générer un QR code:
set /p url="URL : "

:: Demander à l'utilisateur de spécifier un nom pour le fichier QR code
echo Entrez le nom du fichier pour le QR code (ex: mon_qr_code.png):
set /p filename="Nom du fichier : "

:: Vérifier si l'utilisateur a bien mis l'extension .png
echo %filename% | findstr /i ".png" >nul
if %errorlevel% neq 0 (
    set filename=%filename%.png
)

:: Utiliser l'outil curl pour télécharger l'image du QR code depuis l'API
echo Generating QR code for the URL: %url%
curl -o "%filename%" "https://api.qrserver.com/v1/create-qr-code/?data=%url%&size=200x200"

:: Vérifier si le fichier a bien été créé
if exist "%filename%" (
    echo QR code genere avec succes ! Le QR code est sauvegarde sous "%filename%".
) else (
    echo Une erreur est survenue lors de la creation du QR code.
)

pause
