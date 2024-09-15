CONTAINER_NAME=caravana

is_running = $(shell docker ps --filter "name=$(1)" --filter "status=running" -q)

is_stopped = $(shell docker ps -a --filter "name=$(1)" --filter "status=exited" -q)

start_contenedor:
	@if [ -z "$(call is_running,$(CONTAINER_NAME))" ]; then \
		if [ -n "$(call is_stopped,$(CONTAINER_NAME))" ]; then \
			echo "Iniciando el contenedor Caravana..."; \
			docker start $(CONTAINER_NAME); \
		else \
			echo "Caravana ya esta corriendo o no existe."; \
		fi \
	else \
		echo "Caravana ya esta corriendo."; \
	fi

docker-caravanas: start_contenedor
	@echo "Caravana se han iniciado si estaban apagados."
