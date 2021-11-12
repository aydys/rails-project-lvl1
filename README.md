![CI](https://github.com/aydys/rails-project-lvl1/actions/workflows/main.yml/badge.svg)
![Hexlet-Check](https://github.com/aydys/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

Form generator - DSL, with the help of which it is convenient to generate forms. This library takes on tasks that usually require writing a lot of boilerplate code, such as error handling. In the Rails world, Simple Form is used for this. Our generator is conceptually similar to it, but much simpler.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

### Generating Fields

Generating specific fields based on the data of the passed object:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  # Checks if there is a value inside name
  f.input :name
  # Checks if there is a value inside job
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```

If the specified field is not in the object, then an error occurs:

```ruby
html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  # User has no age field
  f.input :age
  f.submit
end
# =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)
```

### Submit

By default, this method uses the Save value as the name of the button, but you can override it by passing the desired text as the first argument.

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input name="commit" type="submit" value="Save" >
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aydys/rails-project-lvl1.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
