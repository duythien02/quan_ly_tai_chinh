filePath="lib/src/app_icons.dart"
touch $filePath

find . -name '.DS_Store' -type f -delete
touch temp
echo "class AppIcons {
    AppIcons._();
    " >$filePath
for f in $(find assets/icons -maxdepth 1 -type f); do
    filename=$(echo $f | cut -d'/' -f3 | cut -d'.' -f1)
    varname=$(echo $filename | perl -pe 's/_([a-z])/uc($1)/ge' | sed -E 's/[@,]//g')
    entry="static const String $varname = '$f';"
    echo "     $entry" >>temp
done
sort temp >>$filePath
printf '}\n\n' >>$filePath
rm -f temp

dart format .
