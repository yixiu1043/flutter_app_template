cd ../../

lineNumber=$(grep -n '^version: ' pubspec.yaml|awk -F ":" '{print $1}')
version=$(grep -n '^version: ' pubspec.yaml|awk -F ":" '{print $3}'|awk -F "+" '{print $1}'| xargs)
code=$(grep -n '^version: ' pubspec.yaml|awk -F ":" '{print $3}'|awk -F "+" '{print $2}')
versionList=($(echo "$version" | tr '.' '\n'))
((versionList[3]++))
((code++))
if ((versionList[3] > 99))
then
  ((versionList[2]++))
  ((versionList[3]=0))
fi
if ((versionList[2] > 99))
 then
  ((versionList[1]++))
  ((versionList[2]=0))
fi
result="version: $versionList[1].$versionList[2].$versionList[3]+$code"
sed -i.bak "${lineNumber}c\\
${result}
" pubspec.yaml
git add 'pubspec.yaml'
git commit -m "chore: 自动更新版本号$versionList[1].$versionList[2].$versionList[3]"
