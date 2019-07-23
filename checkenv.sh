#!/bin/bash

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" --request GET http://$1/crumbIssuer/api/xml)
a=0
while [ ${STATUS_CODE} != 200 -a $a -lt $3 ]
do
 sleep $2
 STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" --request GET http://$1/crumbIssuer/api/xml)
 a=`expr $a + 1`
done
if [ ${STATUS_CODE} != 200 ]; then
 echo "0"
else
 echo "1"
fi
