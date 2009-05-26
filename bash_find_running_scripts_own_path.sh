#echo $BASH_SOURCE
path=""
if [ "${BASH_SOURCE:0:1}" == "/" ]; then
	path="$(dirname $BASH_SOURCE)"
else
	path="$PWD/$(dirname $BASH_SOURCE)"
fi 
path=$( ( cd $path; pwd) )
echo $path
