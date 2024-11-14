up:
	bin/docker s

psql_product:
	PGPASSWORD=vtOcmMhvrQyW9ukubVl74xboYuUOPW3Q psql -h dpg-csolnq9u0jms738m1t90-a.oregon-postgres.render.com -U tracking_tasks_user tracking_tasks

psql_devel:
	psql -U postgres -h 127.0.0.1 tracking_tasks_development;

psql_test:
	psql -U postgres -h 127.0.0.1 tracking_tasks_test;

dump_product:
	PGPASSWORD=vtOcmMhvrQyW9ukubVl74xboYuUOPW3Q pg_dump -cCO -d tracking_tasks -U tracking_tasks_user -h dpg-csolnq9u0jms738m1t90-a.oregon-postgres.render.com > dump.sql

dump_devel:
	pg_dump -ccO -d tracking_tasks_development -w -U postgres -h 127.0.0.1 > dump.devel.sql

db_up:
	sudo systemctl start postgresql

db_down:
	sudo systemctl stop postgresql

db_status:
	sudo systemctl status postgresql
