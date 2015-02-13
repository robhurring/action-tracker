# Tracker

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tracker

## Usage

The tracking event will show up in your rails logs

```ruby
# add our actions to the ApplicationController
class ApplicationController < ActionController::Base
  include Tracker::ControllerActions
  # ...
end

# track actions in your other controllers
class Api::QuotesController < Api::BaseController
  # wraps an around_filter
  track_action :generate

  # wraps a before_filter
  track_start :show

  # wraps an after_filter
  track_finish :update

  # before_filter + after_filter (won't be fired on exceptions)
  track_action! :generate

  def show
    # ...
  end

  def update
    # track_finish won't be fired!
    raise 'Oh No!'
  end

  def generate
    # ...
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tracker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
