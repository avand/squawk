# desc "Explaining what the task does"
# task :application_tweeter do
#   # Task goes here
# end
namespace :squawk do
  desc "Copies a sample initializer to /config/initializers"
  task :install do
		config_file = File.join(File.dirname(__FILE__), '..', '/templates/', 'sample_initializer.rb')
		FileUtils.cp(config_file, RAILS_ROOT + '/config/initializers/squawk.rb')
		puts "Copied sample initializer to /config/initalizers/squawk.rb"
	end
end
