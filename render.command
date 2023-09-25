SCRIPTNAME="RENDER RMD TO WORD by Kenneth Rioja"

echo -e "\n======================================================\n"
echo -e "===== ${SCRIPTNAME} =====\n"
echo -e "======================================================\n"
echo -n -e "\033]0;${SCRIPTNAME}\007"

# redirect terminal to file directory
cd -- "$(dirname "$0")"

# ask what is the main change of this version
echo -n -e "*** INSTRUCTIONS ***\n  Write the subtitle of this version and press enter.\n  This allows you to keep track of your multiple versions.\n  FOR NO SUBTITLE, DIRECTLY PRESS <ENTER>.\n  TO CANCEL THE OPERATION, PRESS control+C (Mac) or Alt+C (Windows)\n"
read SUBTITLE

# execute R script which will create a 'tmp' file containing output_file_name
./render.R $SUBTITLE

# get name of final doc
DOCNAME=$(cat tmp)
echo -e "DOCNAME ="
echo -e ${DOCNAME}
rm tmp

# EOF
echo -e "\nYou can now safely close this window\n"
echo -e "======================================================"
echo -e "This work has been done by Kenneth Rioja under a Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Licence\n"
echo -e "You are free to:\n  Share — copy and redistribute the material in any medium or format\n  Adapt — remix, transform, and build upon the material\n  The licensor cannot revoke these freedoms as long as you follow the license terms."
echo -e "Under the following terms:\n  Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.\n  NonCommercial — You may not use the material for commercial purposes.\n  ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.\n  No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits."
echo -e "======================================================"

# to automatically open threshold.csv file and close terminal, uncomment next line - otherwise comment
open ${DOCNAME}

# to automatically close terminal window, uncomment next line
osascript -e 'tell application "Terminal" to close (every window whose name contains "RENDER RMD TO WORD by Kenneth Rioja")' &

exit 0
