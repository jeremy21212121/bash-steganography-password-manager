#!/bin/bash
# Must be run from terminal.
#
# Arg is file to decrypt, no extension. Outputs plaintext to stdout
# eg.
#   ./ungpg.sh gmail
#
set -e
# temp encrypted file
tmpf=$XDG_RUNTIME_DIR/$1.gpg
# extract encrypted text from the stego file
steghide extract -p "" -sf $1.jpg -xf $tmpf
# decrypt the extracted text and display to stdout
gpg -d $tmpf
# delete temporary file
rm $tmpf
exit 0
