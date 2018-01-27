<img src="https://user-images.githubusercontent.com/8730447/35465962-e09b6fdc-02cd-11e8-88f7-684969565f3c.png"/>

A single user identification entrance (auth). Potpie utilizes one time passwords (OTP) which are compatible with Google Authenticator on both Android and iPhone. It's time to ditch that HTTP Basic authentication for an even easier method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'potpie'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install potpie

## Usage

#### Configuration
Create a new file titled `potpie.rb` within `config/initializers/`. Set both `base32_secret` and `user_email` to your own unique values. We HIGHLY recommend you store these values in Environment variables.
```ruby
Potpie.configure do |config|
  config.base32_secret = ENV["POTPIE_CONFIG_BASE32_SECRET"]
  config.user_email = ENV["POTPIE_CONFIG_USER_EMAIL"]
end
```
Upon installation of Potpie, feel free to utilize our builtin Base32 string generator within the rails console to provide a unique Base32 string. However, creating your own is okay too (16 chars in length).
```
Potpie.random_base32
 => "wil3usmyllhhrgvm"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jlholm/potpie.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
