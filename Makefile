install:
	docker compose up -d
delete:
	docker compose down --rmi all -v