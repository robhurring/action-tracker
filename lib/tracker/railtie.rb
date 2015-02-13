module Tracker
  class Railtie < Rails::Railtie
    initializer 'tracker.subscriber' do
      ActiveSupport::Notifications.subscribe(TRACKER_NOTIFICATION_NAME) do |*args|
        event = Tracker::Event.new(*args)
        Tracker.track(event)
      end
    end
  end
end
