.PHONY: kick spec cucumber lint

kick:
	bundle exec kicker -r ruby


spec:
	bundle exec rspec --color --format=doc

cucumber:
	bundle exec cucumber

lint:
	bundle exec rubocop
