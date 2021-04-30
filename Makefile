.PHONY: down up update-db

down:
	docker-compose down

up:
	docker-compose up --build -d && docker-compose exec web pipenv run python app/db.py

update-db:
	docker-compose exec web pipenv run python app/db.py
