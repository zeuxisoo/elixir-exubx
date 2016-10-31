.PHONY: deps

usage:
	@echo "make hex"
	@echo "make rebar"
	@echo "make deps"
	@echo "make publish"

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

publish:
	@mix hex.publish

docs:
	@mix docs
