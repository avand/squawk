# Set your the handle and password of the Twitter account you want to Squawk to:
Squawk.twitter_handle = "..."
Squawk.twitter_password = "..."

# Register events you'd like to call in your application with plain old strings:
Squawk.register_event :site_down, "Site just went down"

# Register events that create dynamic alerts:
Squawk.register_event :user_signed_up, lambda { |user| "#{user.name} just signed up" }
