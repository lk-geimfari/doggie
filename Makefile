test:
	mix test

docs:
	mix docs && mix hex.publish docs

deps:
	mix deps.get

compile:
	mix compile

release:
	mix hex.publish

.PHONY: test deps compile release docs
