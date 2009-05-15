require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "is_taggable"))

ActiveRecord::Base.send :include, ActiveRecord::Is::Taggable
ActiveRecord::Base.send :include, ActiveRecord::Is::Tagger

RAILS_DEFAULT_LOGGER.info "** is_taggable: initialized properly."
