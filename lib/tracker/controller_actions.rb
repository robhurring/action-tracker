module Tracker
  # Include in your rails application's controllers to provide hooks into the
  # controller
  module ControllerActions
    extend ActiveSupport::Concern

    module ClassMethods
      # track the start _and_ finish of an action.
      # NOTE: will _not_ fire the `after_action` callback if an exception is
      #       raised. this is important if tracking incomplete requests
      def track_action!(*actions)
        before_filter ActionTracker, only: actions
        after_filter ActionTracker, only: actions
      end

      # will fire a tracking event even if exceptions are raised
      def track_action(*actions)
        around_filter ActionTracker, only: actions
      end

      # will fire a tracking event on the start of the action
      def track_start(*actions)
        before_filter ActionTracker, only: actions
      end

      # will fire a tracking event upon successful completion of an action
      # NOTE: won't fire if action has an exception
      def track_finish(*actions)
        after_filter ActionTracker, only: actions
      end
    end
  end
end
