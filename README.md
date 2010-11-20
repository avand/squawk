Squawk
==================

Squawk gives you a very simple way to keep track of activity on your site.

With Squawk you can keep tabs on what's happening on your website with simple commands like this:

    Squawk.user_signed_in! @user

You define the message and see it all happen in real-time on the Twitter account of your choice

Installation
============
Because Squawk talks to Twitter, it has to run in the background. At least for now, Squawk assumes that you're using delayed_job.

Add Squawk to your Gemfile:

    gem 'squawk'

Then create your the initializer config/initializers/squawk.rb:

    # Set up all the authorization stuff:
    Squawk.twitter_consumer_key    = "..." # Get this from Twitter
    Squawk.twitter_consumer_secret = "..." # Get this from Twitter
    Squawk.twitter_handle          = "..." # i.e. mycoolproduct_app
    Squawk.twitter_access_token    = "..." # Get this from Twitter
    Squawk.twitter_secret          = "..." # Get this from Twitter

    # Register events you'd like to call in your application with plain old strings:
    Squawk.register_event :site_down, "Site just went down"

    # Register events that create dynamic alerts:
    Squawk.register_event :user_signed_up, lambda { |user| "#{user.name} just signed up" }

    # Use Squawk to catch exceptions (useful in those hard to reach places exception apps miss):
    Squawk.register_event :error_caught, lambda { |error| "Boom! #{error.message}" }

Usage
=====
    
Register a new event in config/initializers/squawk.rb:

    Squawk.register_event :not_found, "Someone just hit a page that does not exist"

Want a more dynamic message? No problem, use a lambda to construct your own message at runtime:

    Squawk.register_event :user_created, lambda { |user| "#{user.name} just created the #{User.count.ordinalize} account" }

Fire an event from anywhere in your app (controller, background job, mailer, go nuts):

    Squawk.event_name!

At at time, see all the registered events:

    Squawk.events

Notes
=====

Squawk only tweets in production. In non-production environments you can grep the log ("Squawk") to see what it would have tweeted.

Twitter enforces [rate limits](http://apiwiki.twitter.com/Rate-limiting), so play nice!

This plugin uses [Twitter's OAuth](http://dev.twitter.com/pages/oauth_faq), so you need:

* A Twitter browser-based application (something like "<your app name> Squawk Gem" with a callback of 'http://127.0.0.1')
* A protected Twitter account to post activity to (something like "<your app name>_squawk")
* Grant access to that account from the Twitter app you created

Installation
============

This plugin uses [Twitter's OAuth](http://dev.twitter.com/pages/oauth_faq), so first you'll need to set up:

1. A Twitter browser-based application (something like "<your app name> Squawk Gem" with a callback of 'http://127.0.0.1')
2. A protected Twitter account to post activity to (something like "<your app name>_squawk")
3. Grant access to that account from the Twitter app you created

Unfortunately, to get that last step working is kind of pain:

    > require 'twitter'
    
    > consumer_key    = '...' # Your Twitter app's consumer key
    > consumer_secret = '...' # Your Twitter app's secret key
    
    > oauth = Twitter::OAuth.new consumer_key, consumer_secret
    > oauth.set_callback_url('http://127.0.0.1:3000') # really anything your machine can GET
    
    > request_token  = oauth.request_token.token
    > request_secret = oauth.request_token.secret
    
    > authorize_url = oauth.request_token.authorize_url
    
    # Browse to that authorize url.
    # You'll be asked to authorize your app. Use the protected Twitter account's credentials.
    # Twitter will redirect you back to whatever URL you specified.
    
    > oauth_verifier = '...' # Grab the oauth_verifier from the query parameters of the callback.
    
    > oauth.authorize_from_request(request_token, request_secret, oauth_verifier)
    
    > token  = oauth.access_token.token  # Set this in the initializer as Squawk.twitter_access_token
    > secret = oauth.access_token.secret # Set this in the initializer as Squawk.twitter_secret

Please [contact me](http://avandamiri.com/talk_to_me.html) if you find this useful and/or would like to contribute.

Copyright (c) 2010 Avand Amiri, released under the MIT license
