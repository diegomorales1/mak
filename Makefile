CONTAINER_NAME=finanza

is_running = $(shell docker ps --filter "name=$(1)" --filter "status=running" -q)

is_stopped = $(shell docker ps -a --filter "name=$(1)" --filter "status=exited" -q)

start_contenedor:
	@if [ -z "$(call is_running,$(CONTAINER_NAME))" ]; then \
		if [ -n "$(call is_stopped,$(CONTAINER_NAME))" ]; then \
			echo "Iniciando el contenedor Finanza..."; \
			docker start $(CONTAINER_NAME); \
		else \
			echo "Finanza ya esta corriendo o no existe."; \
		fi \
	else \
		echo "Finanza ya esta corriendo."; \
	fi

docker-finanzas: start_contenedor
	@echo "Finanza se han iniciado si estaban apagados."
