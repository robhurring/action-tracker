require 'tracker/version'
require 'tracker/event'
require 'tracker/action_tracker'
require 'tracker/controller_actions'
require 'tracker/railtie'

module Tracker
  TRACKER_NOTIFICATION_NAME = 'tracker'

  module_function

  # TODO: send to beacon
  def track(event)
    Rails.logger.debug "-----> [track:#{event.duration}ms] #{event.inspect}"
  end
end
