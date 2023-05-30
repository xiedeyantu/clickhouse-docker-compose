.PHONY: config
config:
	rm -rf clickhouse-s1-r1 clickhouse-s1-r2 clickhouse-s2-r1 clickhouse-s2-r2
	mkdir -p clickhouse-s1-r1 clickhouse-s1-r2 clickhouse-s2-r1 clickhouse-s2-r2
	REPLICA=1 SHARD=1 envsubst < config.xml > clickhouse-s1-r1/config.xml
	REPLICA=2 SHARD=1 envsubst < config.xml > clickhouse-s1-r2/config.xml
	REPLICA=1 SHARD=2 envsubst < config.xml > clickhouse-s2-r1/config.xml
	REPLICA=2 SHARD=2 envsubst < config.xml > clickhouse-s2-r2/config.xml
	cp users.xml clickhouse-s1-r1/users.xml
	cp users.xml clickhouse-s1-r2/users.xml
	cp users.xml clickhouse-s2-r1/users.xml
	cp users.xml clickhouse-s2-r2/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: down
down:
	docker-compose down

