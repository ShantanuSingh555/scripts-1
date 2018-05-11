git clone https://github.com/BootleggersROM/BootleggersROM.github.io .tmp/

echo -e "\ncodename:"
read devcodename

devmaintainer=$(grep devmaintainer .tmp/_devicelist/$devcodename.md | cut -d' ' -f2-)
devxdathread=$(grep devxdathread .tmp/_devicelist/$devcodename.md | cut -d' ' -f2-)
devdlink=$(grep devdlink .tmp/_devicelist/$devcodename.md | cut -d' ' -f2-)

echo -e "\n/save $devcodename"
echo "BootleggersROM for $devcodename"
echo "Maintainer:- $devmaintainer"
echo "[Builds](buttonurl:$devdlink)"
echo -e "[XDA Thread](buttonurl:$devxdathread:same)\n"

rm -rf .tmp
