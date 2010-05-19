# desc "Explaining what the task does"
# task :application_tweeter do
#   # Task goes here
# end
namespace :squawk do
  desc "Copies a sample config to /config/squawk.rb"
  task :install do
		config_dir = RAILS_ROOT + '/config'
		config_file = File.join(File.dirname(__FILE__), '..', '/templates/', 'squawk.config.rb')
		FileUtils.cp(config_file, config_dir)
		puts "Copied sample config to /config/squawk.rb"
	end
end
