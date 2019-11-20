#!/bin/bash
read -p "please input mysql username and password: " username password

execute_sql=\
"
use dealmoon;
DELETE
FROM
	deal_editor
WHERE
	deal_id > (
		SELECT
			max(id)
		FROM
			deal_index
		WHERE
			create_time < _date_
	)
AND create_date < _date_;
"

for i in `seq 0 12`
do
    curr_date=$(date -d "-$i month" +%Y-%m-%d)
    result=$(mysql -u$username -p$password -e "${execute_sql//_date_/'$curr_date'}" -vv)
    echo -e $result
done