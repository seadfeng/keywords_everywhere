# KeywordsEverywhere

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/keywords_everywhere`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keywords_everywhere'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install keywords_everywhere

## Usage

# configure
```ruby
KeywordsEverywhere.configure do |config|
      config.secret_key = 'some_key'
end
c = KeywordsEverywhere::Client.new
c.search_items(['nike','hp'])
```
# or 
```ruby
c = KeywordsEverywhere::Client.new(secret_key: 'some_key')
c.search_items(['nike','hp'])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/seadfeng/keywords_everywhere. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/seadfeng/keywords_everywhere/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeywordsEverywhere project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/seadfeng/keywords_everywhere/blob/master/CODE_OF_CONDUCT.md).
