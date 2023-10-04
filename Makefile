build:
	@echo Building and tagging SQLSERVER
	docker build -t sqlserver/teamcity:latest -f sqlserver/Dockerfile .

stack-teamcity-nodes: 
	docker-compose -f ./docker-compose.yml --profile nodes down
	docker-compose -f ./docker-compose.yml --profile nodes rm
	docker-compose -f ./docker-compose.yml --profile nodes up --remove-orphans

stack-teamcity-ubuntu: 
	docker-compose -f ./docker-compose.yml --profile ubuntu down
	docker-compose -f ./docker-compose.yml --profile ubuntu rm
	docker-compose -f ./docker-compose.yml --profile ubuntu up --remove-orphans

stack-teamcity: 
	docker-compose -f ./docker-compose.yml --profile docker down
	docker-compose -f ./docker-compose.yml --profile docker rm
	docker-compose -f ./docker-compose.yml --profile docker up --remove-orphans