module Tracker
  # See: http://api.rubyonrails.org/classes/ActiveSupport/Notifications/Event.html
  class Event < ActiveSupport::Notifications::Event
    attr_reader :metric

    def initialize(*)
      super
      @metric = payload.delete(:metric)
    end
  end
end
