Gaspard PEPIN
ING 3 Cyber Groupe A

Cours sur les shellcodes

Concernant shellcode01.c : 
Pour récupérer le shellcode (très long), j'ai trouvé la commande suivante sur internet utilisant objdump :

objdump -d ./shellcode|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'       


Concernant wrapper.c :
Modifié d'internet, il prend un argument un shellcode qu'il charge en mémoire et l'exécute ensuite.
J'ai du mal à le faire fonctionner même avec des shellcodes très courts.