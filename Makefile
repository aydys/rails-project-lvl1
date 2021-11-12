install:
	gem install bundler -v 2.2.0
	bundle install

tests:
	bundle exec rake

run_linter:
	rubocop --require rubocop-minitest