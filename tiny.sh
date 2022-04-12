#   This is a Bash script designed to utilize TinyPNG's CLI using the API
#   Before using this, you would require:-
#       1. TinyPNG CLI - get it from here https://www.npmjs.com/package/tinypng-cli
#       2. NPM to install
#       3. A TinyPNG account to get a free API key (Monthly free 500 compressions using API)
#
#   Usage :- 
#       1. Save this file as anything you'd like with the .sh extension eg. tiny.sh
#       2. Add your API key into the 'KEY' variable
#       3. Open your terminal and navigate to the folder where you have images stored, preferrable in folders inside
#          a directory
#       4. Enter ./tiny.sh followed by arguments which are the name of the folders inside the
#          directory eg. ./tiny.sh imgfolder1 imgfolder2 imgfolder3
#       5. Enter the name of the new directory into which this script will copy the folders into and
#          run the TinyPNG CLI
#       6. Enter the name of the directory in which the folders given in the arguments exist
#       7. All Done! Wait for the script to finish


myArray=("$@")
KEY="ENTER YOUR TINYPNG API KEY HERE!"
echo "Enter directory to be created"
read FILENAME
echo "Enter directory to be copied"
read TARGET
mkdir $FILENAME
echo "$FILENAME dir created at $(date)"
for arg in "${myArray[@]}"
do
    cp -r $TARGET/$arg $FILENAME/
    echo "Copied $TARGET/$arg into $FILENAME successfully at $(date)!"
    tinypng $FILENAME/$arg/* -k $KEY
    echo "Compressed contents of $FILENAME/$arg successfully at $(date)!"
done
echo "All Done, enjoy!!"