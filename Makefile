.PHONY: down test up update-db test

down:
	docker-compose down

up:
	docker-compose up --build -d && docker-compose exec web pipenv run python app/db.py

update-db:
	docker-compose exec web pipenv run python app/db.py

test:
	docker-compose exec web pipenv run python -m pytest -v

test-cov:
	docker-compose exec web pipenv run python -m pytest --cov="."

test-cov-html:
	docker-compose exec web pipenv run python -m pytest --cov="." --cov-report html

lint:
	docker-compose exec web pipenv run flake8 /usr/src/app
