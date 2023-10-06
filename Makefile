build:
	@echo Building and tagging SQLSERVER
	docker build -t sqlserver/teamcity:latest -f sqlserver/Dockerfile .

stack-teamcity: 
	docker-compose -f ./docker-compose.yml --profile teamcity down
	docker-compose -f ./docker-compose.yml --profile teamcity rm
	docker-compose -f ./docker-compose.yml --profile teamcity up --remove-orphans

stack-space: 
	docker-compose -f ./docker-compose.yml --profile space down
	docker-compose -f ./docker-compose.yml --profile space rm
	docker-compose -f ./docker-compose.yml --profile space up --remove-orphans

stack-dev:
	docker-compose -f ./docker-compose.yml --profile dev down
	docker-compose -f ./docker-compose.yml --profile dev rm
	docker-compose -f ./docker-compose.yml --profile dev up --remove-orphans

stack:
	docker-compose -f ./docker-compose.yml --profile all down
	docker-compose -f ./docker-compose.yml --profile all rm
	docker-compose -f ./docker-compose.yml --profile all up --remove-orphans

