.PHONY: init-react init backend-i frontend-i backend frontend stop

init-react:
	docker-compose stop
	docker-compose down -v
	rm -rf frontend
	rm -rf backend
	mkdir "backend"
	mkdir "frontend"
	docker-compose run --rm backend bash -c "npm install -g @nestjs/cli && nest new . --skip-git"
	docker-compose run --rm frontend bash -c "npm install -g create-vite vite && create-vite . --template react-ts"
	docker-compose up

init:
	docker-compose down -v
	rm -rf frontend
	rm -rf backend
	mkdir "backend"
	mkdir "frontend"
	docker-compose run --rm backend bash -c "npm install -g @nestjs/cli && nest new . --skip-git"
	docker-compose run --rm frontend bash -c "npm install -g create-vite vite && create-vite . --template vue-ts"
	docker-compose up

backend-i:
	docker-compose run backend bash -c "npm i $(filter-out $@,$(MAKECMDGOALS))"

frontend-i:
	docker-compose run frontend bash -c "npm i $(filter-out $@,$(MAKECMDGOALS))"

backend:
	docker exec -it backend bash

frontend:
	docker exec -it frontend bash

stop:
	docker-compose stop

%:
	@:
