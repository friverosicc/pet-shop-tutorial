help:
	@echo -------------------------------------------------
	@echo '|          Makefile help commands              |'
	@echo -------------------------------------------------
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed -e 's/:/   /'

build-image: ## Build the docker images
	docker-compose -f $(PWD)/docker/docker-compose.yml build --no-cache

up: ## Ups all the containers related to this project
	docker-compose -f $(PWD)/docker/docker-compose.yml up -d

stop: ## Stop all the containers
	docker-compose -f $(PWD)/docker/docker-compose.yml stop

ps: ## Show the status of all the containers
	docker-compose -f $(PWD)/docker/docker-compose.yml ps

logs: ## Display the container logs
	docker-compose -f $(PWD)/docker/docker-compose.yml logs -f

compile: ## Compile the contracts
	docker exec -it docker_truffle-app_1 truffle compile

migrate: ## Deploy the contracts on the developmentDocker network
	docker exec -it docker_truffle-app_1 truffle migrate --network developmentDocker

test-contracts: ## Test the contracts on the developmentDocker network
	docker exec -it docker_truffle-app_1 truffle test --network developmentDocker

test-security: ## Test the contracts to check security issues
	docker run -v $(PWD):/tmp -w "/tmp/" mythril/myth --truffle

debug-transaction: ## Debug an specific transaction 
	docker exec -it docker_truffle-app_1 truffle debug $(tx-hash)

truffle-console: ## Launch the truffle console
	docker exec -it docker_truffle-app_1 truffle console --network developmentDocker

truffle-bash: ## Launch the bash console from the truffle container
	docker exec -it docker_truffle-app_1 bash
