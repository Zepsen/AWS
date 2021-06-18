#!/bin/bash

echo 'Enter date in Y-m-d'
read date

echo 'Enter bucket'
read bucket

$keys=aws s3api list-objects --bucket $bucket --query 'Contents[?LastModified<=`{$date}`][].Key'

for key in ${keys[*]}
do
  aws s3api get-object --bucket $bucket --key $key new-$key
done