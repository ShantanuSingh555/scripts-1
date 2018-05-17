#usage: bash botsave.sh codename
git clone https://github.com/BootleggersROM/BootleggersROM.github.io .tmp/

devmaintainer=$(grep devmaintainer .tmp/_devicelist/$1.md | cut -d' ' -f2)
devxdathread=$(grep devxdathread .tmp/_devicelist/$1.md | cut -d' ' -f2)
devdlink=$(grep devdlink .tmp/_devicelist/$1.md | cut -d' ' -f2)

echo -e "\n/save $1"
echo "BootleggersROM for $devcodename"
echo "Maintainer:- $devmaintainer"
echo "[Builds](buttonurl:$devdlink)"
echo -e "[XDA Thread](buttonurl:$devxdathread:same)\n"

rm -rf .tmp
