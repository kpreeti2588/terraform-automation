if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ]
then
  echo "Usage: merge-reports.sh <SIMULATION_REPORT_URL> <OUTPUT_FOLDER> <TIMESTAMP OF REPORTS>\n"
  echo "i.e. merge-reports.sh http://gatling-reports.tmaws.io/?simulation=LandingPageTestCookieCached&env=preprod1 /tmp/report1 2017-06-26T20:34:55Z"
  exit 1
fi

OUTPUT_FOLDER=$2

mkdir -p ${OUTPUT_FOLDER}
wget -O ${OUTPUT_FOLDER}/html "${1}"
for i in `cat ${OUTPUT_FOLDER}/html | tr "<" '\n' | grep ${3} | awk -F"'" {'print $2'}`
do echo ${i}simulation.log >> ${OUTPUT_FOLDER}/links.txt
done
rm ${OUTPUT_FOLDER}/html

NAME=1
for i in `cat ${OUTPUT_FOLDER}/links.txt`
do
  wget -O ${OUTPUT_FOLDER}/${NAME}.log ${i}
  NAME=$((NAME+1))
done
rm ${OUTPUT_FOLDER}/links.txt

docker run --rm -it -v ${OUTPUT_FOLDER}:/report tmhub.io/aws/gatling:2.2.4 -ro /report
rm ${OUTPUT_FOLDER}/*.log
