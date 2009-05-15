require "rubygems"
require "spec"

gem "activerecord"
require "active_record"

RAILS_DEFAULT_LOGGER = Logger.new($stdout)

adapter = ENV['ADAPTER'] || "sqlite3"

ActiveRecord::Base.establish_connection({:adapter => adapter}.merge(YAML.load_file(File.dirname(__FILE__) + "/database.yml")[adapter]))

require File.dirname(__FILE__) + "/../rails/init"

puts "Testing with #{adapter}..."

if adapter == "sqlite3"
  ActiveRecord::Is::Taggable.use_multiple_inserts = false
end

module Spec::Example::ExampleGroupMethods
  alias :context :describe
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

load(File.dirname(__FILE__) + '/schema.rb')

class TaggableModel < ActiveRecord::Base
  is_taggable :tags, :languages
  is_taggable :skills
end

class OtherTaggableModel < ActiveRecord::Base
  is_taggable :tags, :languages
end

class InheritingTaggableModel < TaggableModel
end

class AlteredInheritingTaggableModel < TaggableModel
  is_taggable :parts
end

class TaggableUser < ActiveRecord::Base
  is_tagger
end

class UntaggableModel < ActiveRecord::Base
end
