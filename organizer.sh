cd $1
for f in *\ *; do mv "$f" "${f// /_}"; done  # to remove the space in file names
ls pdfs  > /dev/null || mkdir pdfs # To check if the dir exists or not. 
ls images > /dev/null || mkdir images 
files=$(ls $1)
for file in $files
do
	if [ -d "$file" ]; then
		continue
	fi

	if [ $(head -c 4 "$file") = "%PDF" ]; then
    	mv $file pdfs/
	fi
	if file "$file" | grep -qE 'image|bitmap'; then
  		mv $file images/
	fi
done 
