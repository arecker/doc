USER := $(shell whoami)

ifeq ($(USER), root)
BIN := $(shell test -d /usr/local/bin && echo "/usr/local/bin" || echo "/usr/bin")
else
BIN := ${HOME}/bin
endif

.PHONY: all
all:
	@echo "[nothing specified for ALL yet]"

.PHONY: install uninstall link
install: doc
	@echo [copying ./doc to $(BIN)/doc]
	@cp ./doc $(BIN)/doc
	@echo [making $(BIN)/doc executable]
	@chmod +x $(BIN)/doc
link:
	@echo [sym linking ./doc to $(BIN)/doc]
	@ln -s $(shell pwd)/doc $(BIN)/doc
uninstall:
	@echo [removing $(BIN)/doc]
	@rm -f $(BIN)/doc
