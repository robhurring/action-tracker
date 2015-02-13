module Tracker
  # handles the `*_action` for controller
  module ActionTracker
    module_function

    def around(controller, &block)
      track metric_name(controller.params), &block
    end

    def before(controller)
      track metric_name('start', controller.params)
    end

    def after(controller)
      track metric_name('finish', controller.params)
    end

    def track(metric, &block)
      ActiveSupport::Notifications.instrument TRACKER_NOTIFICATION_NAME, {metric: metric}, &block
    end

    def metric_name(*args)
      params = args.extract_options!
      [params.values_at(:controller, :action), *args].flatten.join('.')
    end
  end
end
