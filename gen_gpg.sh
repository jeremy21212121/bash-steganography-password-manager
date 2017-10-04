#!/bin/bash
#
# Must be run from terminal.
#
# Uses gen.sh ( https://github.com/jeremy21212121/bash-random-password ) to generate a random password of desired length from /dev/urandom, encrypts it using gpg, then hides it in a copy of a random jpeg picture from ~/Pictures.
# The process can be reversed using ungpg.sh
#
# first arg is pw length, second arg is file name
# eg.
#  ./gen_gpg.sh 20 gmail
# this will create a file called gmail.gpg containing the encrypted password
#
# Dependencies: distro that uses systemd like ubuntu, steghide(sudo apt-get install steghide), gen.sh(from bash-random-password, pulled in as a submodule), gpg (sudo apt-get install gpg), current user must have a gpg key.
# See the following link for a guide to generating a gpg key: https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages-on-an-ubuntu-12-04-vps#set-up-gpg-keys
#
set -e
# make a list of jpg files in ~/Pictures and one level of subdirectories
find ~/Pictures/*.jpg > $XDG_RUNTIME_DIR/pics.txt
find ~/Pictures/*/*.jpg >> $XDG_RUNTIME_DIR/pics.txt
# pick one, need not be truly random
randompic=$(shuf -n 1 $XDG_RUNTIME_DIR/pics.txt)
# temp gpg file
tmpf=$XDG_RUNTIME_DIR/$2.gpg
# generates string and encrypts to the temp file
bash-random-password/gen.sh $1 | gpg -e -a -r $USER > $tmpf
# hide the gpg encrypted string in a picture, just 'cause we can!
steghide embed -p "" -cf $randompic -ef $tmpf -sf $2.jpg
# clean up temp files, even though they should only be accessible by the scripts process and dont contain the plaintext password
rm $XDG_RUNTIME_DIR/pics.txt
rm $tmpf
exit 0

