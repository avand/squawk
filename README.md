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



Copyright (c) 2010 Avand Amiri, released under the MIT license
