# SpaRails

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/spa_rails`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spa_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spa_rails

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spa_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Critical changes v1.0.0

Install sprockets-rails to version 3.0.0 and newer

If you have previously installed a old version of gem, then you must uninstall this version with e.g.

    $ gem uninstall sprockets-rails

and install needed version

    $ gem install sprockets-rails -v 3.0.0

Check sprockets v3 [critical changes](https://github.com/rails/sprockets-rails#changes-from-rails-3x)

Replace old gem angular-rails-templates by newer 

    $ gem 'angular-rails4-templates', '~> 0.4.1'

And read [install instructions](https://github.com/gaslight/angular-rails4-templates) 

Change all templates extensions 
For example `.html.slim` to `.ngslim`

```
$ cd project/directory
$ find -L . -type f -name "*.html.slim" -print0  | while IFS= read -r -d '' FNAME; do     mv -- "$FNAME" "${FNAME%.html.slim}.ngslim"; done
```

Exclude `.ngslim` from precompile. Add to `application.rb` config 
```
config.spa_rails.manifest_extensions << '.ngslim'
``` 
