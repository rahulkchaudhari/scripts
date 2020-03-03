

FILES=$(find /home/rahulc/Desktop -type f -name \*.md)
#path=/home/rahulc/new.pdf
for f in $FILES
do
  filename="${f%.*}"
  echo "Converting $f to $filename.pdf"
  pandoc $f -t latex -o $filename.pdf
  # uncomment this line to delete the source file.
  # rm $f
done

