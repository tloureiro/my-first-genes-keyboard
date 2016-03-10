# my-first-genes-keyboard

#### Setting it up on the Raspberry Pi 2:
1- Image used: https://ccrma.stanford.edu/~eberdahl/Satellite/ (comes with SuperCollider installed and properly configured)

2- apt-get install vkeybd (to emulate a MIDI controller)

3- place the ./code/.vkeybdmap file on the user folder (you can change this file if you want to use another keyboard layout)

4- Init your jack server:
jackd -P75 -dalsa -dhw:1 -p1024 -n3 -s -r44100 -s&

(use -dhw:1 if you have an USB sound card or -dhw:0 for the default one)

5- start vkeybd: vkeybd --octave 4 --keymap=/home/pi/.vkeybdmap

6- run sclang ./code/keyboard_pre_alpha_preview0.scd
or sclang ./code/sound_in.scd


7- select the vkeybd window, press some keys (1-0, Q-P, A-L, Z-M) and see if it works.
I hope it works I don't know
