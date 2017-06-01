# Bash Steganographic Password Manager
...or BS password manager, for short ;)

## What?

It's a CLI password manager that further obfuscates the encrypted password by hiding it in an image.

You supply a name and a password length, it [generates a random password](https://github.com/jeremy21212121/bash-random-password), encrypts it using your GPG key and hides the resulting ciphertext in a JPEG image.


## Dependencies

1. Ubuntu or other linux distro that uses systemd
2. steghide, CLI steganography program that does the magic. `sudo apt-get install steghide`
3. gpg (`sudo apt-get install gpg` ). Also, current user must have a gpg key. [Here's how to generate one, if needed.](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages-on-an-ubuntu-12-04-vps#set-up-gpg-keys)
4. gen.sh, which lives [here in its own repo 'cause I wrote it first.](https://github.com/jeremy21212121/bash-random-password)

## Installation
1. First clone this repo
  ```git clone https://github.com/jeremy21212121/bash-steganography-password-manager.git```

2. Change directory into the project
  ```cd bash-steganography-password-manager```

3. Clone the repo to get the gen.sh dependency
  ```git clone https://github.com/jeremy21212121/bash-random-password.git```

4. Install steghide, because it is not installed by default
  ```sudo apt-get install steghide```

5. Install GPG, if you aren't uber 1337
  ```sudo apt-get install gpg```

6. (Optional) If you don't already have a GPG key generated for that user, [here is how to generate one.](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages-on-an-ubuntu-12-04-vps#set-up-gpg-keys)

A later version of this script will make installation MUCH easier. This is the MVP. There will also be an option to use AES-256 in CBC mode, making GPG optional.


## Usage

1. In a terminal in the project folder, run:
  ```./gen_gpg.sh 20 gmail```
  > where "20" is the password length and "gmail" is the name

2. To retrieve your password, run:
  ```./ungpg.sh gmail```
  > where "gmail" is the name you used when you generated the password


## Why?

So the evil h@xx0rs won't even know where to start brute forcing, with my passwords masquerading as innocent JPEGs.

## No, seriously, why?

To brush up on my bash skills, mostly. I've been using bash for 10+ years, but had lots of gaps in my knowledge. 


Also, it was a lot of fun!

It started off as just a random password generator, where I learned about /dev/urandom and (P)RNGs. Then I thought, might as well encrypt them as I can't remember them. After a few months I thought, all those .gpg files look mighty enticing. Maybe I can hide them in pictures! That's when I found steghide.


Now I'm a lot more comfortable writing bash scripts :-)


