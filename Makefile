createdb:
	docker compose exec -it db createdb --username=root --owner=root go_bank
dropdb:
	docker compose exec -it db dropdb go_bank

.PHONY: createdb dropdb