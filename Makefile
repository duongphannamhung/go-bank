createdb:
	docker compose exec -it db createdb --username=root --owner=root go_bank
dropdb:
	docker compose exec -it db dropdb go_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/go_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/go_bank?sslmode=disable" -verbose down

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: createdb dropdb migrateup migratedown test