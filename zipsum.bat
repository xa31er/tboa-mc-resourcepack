@ECHO OFF
REM Compress
rm rp.zip
tar -a -u -f "rp.zip" "rp"

SET "FILENAME=rp.zip"
SET "FILE_HASH="

FOR /F "skip=1 delims=" %%H IN ('CertUtil -hashfile "%FILENAME%"') DO (
    SET "FILE_HASH=%%H"
    GOTO :HashFound
)

:HashFound
REM The hash from CertUtil contains spaces, so we remove them.
SET "FILE_HASH=%FILE_HASH: =%"

ECHO %FILE_HASH% > sha1sum.txt