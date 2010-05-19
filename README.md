Squawk
==================

Squawk gives you a very simple way to keep track of activity on your site.

With Squawk you can keep tabs on what's happening on your website with simple commands like this:

    Squawk.user_signed_in! @user

You define the message and see it all happen in real-time on the Twitter account of your choice

Installation
============
Because Squawk talks to Twitter, it has to run in the background. At least for now, Squawk assumes that you're using delayed_job.

Install Squawk like a typical Rails plugin:

    script/plugin install git@github.com:avand/squawk.git

Then run:

    rake squawk:install

Or just create your own config file called squawk.rb in config.

Usage
=====
    
Register a new event with a string in config/initializers/squawk.rb:

    Squawk.register_event :not_found, "Someone just hit a page that does not exist"

Need more information? No problem, use a lambda to construct your own message at runtime:

    Squawk.register_event :user_created, lambda { |user| "#{user.name} just created the #{User.count.ordinalize} account" }

Fire an event from anywhere in your app:

    Squawk.event_name!

See all the registered events:

    Squawk.events
    
Notes
=====

Twitter enforces rate limits! http://apiwiki.twitter.com/Rate-limiting

For now, this plugin uses curl to hit Twitter. This was for simplicity, but isn't very extensible.


Copyright (c) 2010 Avand Amiri, released under the MIT license
