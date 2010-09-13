# require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")
# require File.expand_path(File.dirname(__FILE__) + "/lib/rake_commands.rb")
# 
class SquawkGenerator < Rails::Generator::Base
  # def add_options!(opt)
  #   opt.on('-ck', '--consumer-key=key', String, "Your app's Twitter consumer key") { |v| options[:twitter_consumer_key] = v }
  #   opt.on('-cs', '--consumer-secret=key', String, "Your app's Twitter secret") { |v| options[:twitter_consumer_secret] = v }
  #   opt.on('-h', '--handle=key', String, "Your protected Twitter handle") { |v| options[:twitter_handle] = v }
  #   opt.on('-a', '--access-token=key', String, "Your Twitter access token for the protected account") { |v| options[:twitter_access_token] = v }
  #   opt.on('-s', '--secret=key', String, "Your Twitter secret for the protected account") { |v| options[:twitter_secret] = v }
  # end
  # 
  # def copy_initializer_file
  #   raise 'hello'
  #   # copy_file "initializer.rb", "config/initializers/#{file_name}.rb"
  # end
  # 
  def manifest
    record do |m|
      m.directory('squawk')
      # m.file('application.css', 'public/stylesheets/application.css')
      # m.template 'initializer.rb', 'config/initializer/squawk.rb'
    end
  end
end