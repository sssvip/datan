git tag -a release-v$1 -m "script auto release ${1}"
git push origin release-v$1
git push aliyun release-v$1
