#!/bin/bash
###############################################
# Update some strings in the project.
#
# @author   Alexander Willner <alex@willner.ws>
# @version  2010-07-27
# @todo     Speed up
#
###############################################


###############################################
# Check
###############################################
if [ "" == "`which gsed`" ]; then
    echo "Install gsed first (e.g. port install gsed).;"
    exit 1;
fi 
###############################################


###############################################
# Functions
###############################################
updateFile() {
    _filename=$1;
    #echo "  Updating $_filename...";
	gsed -r -i "s/\/www\.sente\.ch\/software\/GPGMail/\/www.gpgmail.org/" "$_filename";
	gsed -r -i "s/\/gpgmail.org/\/www.gpgmail.org/" "$_filename";
	gsed -r -i "s/1\.2\.3( \(v62\))?/1.4.0/" "$_filename";
	gsed -r -i "s/1\.3\.0/1.4.0/" "$_filename";
	gsed -r -i "s/ch\.sente\.gpgmail/org.gpgmail/" "$_filename";
	gsed -r -i "s/2000-200[0-9]/2000-2010/" "$_filename";
	gsed -r -i "s/ST.PHANE CORTH.SY/GPGMAIL PROJECT TEAM/" "$_filename";
	gsed -r -i "s/St.phane Corth.sy/GPGMail Project Team/" "$_filename";
	gsed -r -i "s/ST\x83PHANE CORTH\x83SY AND CONTRIBUTORS/THE GPGMAIL PROJECT TEAM/" "$_filename";
	gsed -r -i "s/St\x8Ephane Corth\x8Esy/GPGMail Project Team/" "$_filename";
	gsed -r -i "s/St&eacute;phane Corth&eacute;sy/GPGMail Project Team/" "$_filename";
	gsed -r -i "s/stephane at sente.ch/gpgmail-devel@lists.gpgmail.org/" "$_filename";
	gsed -r -i "s/(\s|\(|<)[a-zA-Z]+@sente.ch/\1gpgmail-devel@lists.gpgmail.org/" "$_filename";
	gsed -r -i "s/ \(Sen\:te\)//" "$_filename";
}
export -f updateFile;
###############################################


###############################################
# Setup
###############################################
ext=( `echo strings plist xml applescript h m` );
###############################################


###############################################
# Change strings
###############################################
echo "Searching in 'designable.nib' files...";
find . -iname "designable.nib" -type f -exec sh -c '"updateFile" {}' \;
for ((i=0; i<${#ext[*]}; i++)) do
    echo "Searching in '${ext[$i]}' files...";
	find . -iname "*.${ext[$i]}" -type f -exec sh -c '"updateFile" {}' \;
done
###############################################

