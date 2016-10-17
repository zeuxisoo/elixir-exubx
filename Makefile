.PHONY: deps

usage:
	@echo "make hex"
	@echo "make rebar"
	@echo "make deps"
	@echo "make run"

hex:
	@rm -rf ~/.mix/archives/hex-*
	@mix local.hex --force

rebar:
	@rm -rf ~/.mix/rebar
	@rm -rf ~/.mix/rebar3
	@mix local.rebar --force

deps: hex rebar
	@rm -rf ./deps
	@mix deps.get

run:
	@mix run
