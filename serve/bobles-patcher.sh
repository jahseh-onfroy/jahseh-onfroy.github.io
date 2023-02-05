VER="1.0.0"
BOBLESDIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
YELLOW='\033[0;33m'
BLUE='\033[1;34m'
LGRAY='\033[0;37m'
WHITE='\033[1;37m'
CLEAR='\033[0m' # Reset color
clear
printf "${GREEN}Welcome to the bobles patcher tool.${CLEAR}\n\n" 
printf "${YELLOW}Please download the appropriate IPA file before continuing.${CLEAR}\n\n"
printf "${YELLOW}Dependencies will now be downloaded.${CLEAR}\n\n" 
printf "${WHITE}Press [RETURN] to continue...${CLEAR}"
read -p ""

printf "${WHITE}Downloading Azule (communism edition)...${CLEAR}\n"
git clone https://github.com/GithubPagesStuff/Azule.git $BOBLESDIR"/azule"
curl -#k https://cdn.discordapp.com/attachments/940033259964866580/1071864920167153685/dragintoterminal.gif -o $BOBLESDIR"/azule/dragintoterminal.gif"
printf "${WHITE}Downloading Script-Ware...${CLEAR}\n"
curl -#k https://script-ware.com/ios_repo/Package.deb -o $BOBLESDIR"/azule/sw.deb"
printf "${WHITE}Downloading rbxupgradespoof...${CLEAR}\n"
curl -#k https://jahseh-onfroy.github.io/debs/mars7383.rbxupgradespoof_1.0_iphoneos-arm.deb -o $BOBLESDIR"/azule/rbxupgradespoof.deb"

clear
printf "${GREEN}Dependencies have been downloaded.\n\n${YELLOW}Now, please drag the IPA file into this window and then press [RETURN].${CLEAR}\n\n"
printf "${WHITE}Decrypted IPA: ${GREEN}"
/usr/bin/qlmanage -p $BOBLESDIR"/azule/dragintoterminal.gif" >> /dev/null 2>&1 &
read decryptedIPA
IPAPath="$(dirname "${decryptedIPA}")"
printf "${CLEAR}\n"
printf "${GREEN}The patch process will now begin.${CLEAR}\n\n"
#printf "${YELLOW}Please enter your admin password if you are asked to do so (it will be in invisible text).\n"
printf "${YELLOW}If you see any errors, please ask for support.${CLEAR}\n\n"
printf "${WHITE}Press [RETURN] to continue...${CLEAR}"
read -p ""
printf "\n\n"

"$BOBLESDIR"/azule/azule -i "$decryptedIPA" -o "$IPAPath"/rbx_sw.ipa -f "$BOBLESDIR"/azule/sw.deb "$BOBLESDIR"/azule/rbxupgradespoof.deb -v
rm -rf "$BOBLESDIR"
open -R "$IPAPath"/rbx_sw.ipa
printf "${WHITE}Press [RETURN] to continue...${CLEAR}"
read -p ""
clear

printf "${GREEN}All done!${CLEAR}\n\n"
printf "${YELLOW}If you had any problems, please ask for support.${CLEAR}\n\n"
printf "${WHITE}Press [RETURN] to exit.${CLEAR}"
read -p ""
clear
exit 0