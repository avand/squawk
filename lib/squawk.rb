class Squawk < Struct.new(:status)
  @@twitter_handle = nil
  @@twitter_password = nil

  cattr_accessor :twitter_handle, :twitter_password
  cattr_reader :events

  class << self
    # Registers an update event. For example:
    #   Squawk.register_event :site_down, "Site just went down"
    #   Squawk.register_event :user_signed_up, lambda { |user| "#{user.name} just signed up" }
    # provide you with:
    #   Squawk.site_down!
    #   Squawk.user_signed_up! @user
    def register_event(event_name, message_or_method)
      @@events ||= []
      
      event_name = event_name.to_sym
      
      return if @@events.include?(event_name)
      
      @@events << event_name.to_sym
      
      method_name = "#{event_name}!"

      metaclass.instance_eval do # http://ryanangilly.com/post/234897271/dynamically-adding-class-methods-in-ruby
        # First, the easy case - string
        if message_or_method.is_a?(String)
          define_method method_name do
            update message_or_method
          end
        # Now, the harder case - lambda
        else
          define_method method_name do |*params|
            update(message_or_method.call(*params))
          end
        end
      end  
    end

    def test!
      update("The time is currently #{Time.now}")
    end

    private

      def update(status)
        status = status[0...140] # trim status to min Twitter length
      
        Rails.logger.info("Squawk (@#{@@twitter_handle}): #{status}")
        Delayed::Job.enqueue new(status[0...140]) if Rails.env.production?
      
        status
      end
  end

  def perform
    raise "Twitter update failed" unless Kernel.system(
      "curl -u #{TWITTER_HANDLE}:#{TWITTER_PASSWORD} -d \"status=#{URI.escape(status)}\" http://twitter.com/statuses/update.xml"
    )
  end
end
