Gem::Specification.new do |s|
  s.name = "is_taggable"
  s.version = "0.88"
  s.date = "2008-12-11"
  s.summary = "Tagging for ActiveRecord with custom contexts, advanced features, and optimizations."
  s.email = "ben.alavi@citrusbyte.com"
  s.homepage = "http://labs.citrusbyte.com/is_taggable"
  s.description = "is_taggable supports pretty much everything as the origin acts-as-taggable-on but is highly optimized to eliminate write blocking problems."
  s.has_rdoc = false
  s.authors = %w( Ben\ Alavi Michel\ Martens )
  s.files = %w(
    CHANGELOG
    MIT-LICENSE
    README
    generators/is_taggable_migration
    generators/is_taggable_migration/is_taggable_migration_generator.rb 
    generators/is_taggable_migration/templates 
    generators/is_taggable_migration/templates/migration.rb 
    init.rb 
    lib/is_taggable.rb 
    lib/is_taggable/is_taggable.rb 
    lib/is_taggable/is_tagger.rb 
    lib/is_taggable/tag_list.rb 
    lib/is_taggable/tagging.rb 
    lib/is_taggable/tags_helper.rb 
    lib/is_taggable/string.rb
    rails/init.rb 
    spec/is_taggable 
    spec/is_taggable/is_taggable_spec.rb 
    spec/is_taggable/tag_list_spec.rb 
    spec/is_taggable/taggable_spec.rb 
    spec/is_taggable/tagger_spec.rb 
    spec/is_taggable/tagging_spec.rb 
    spec/debug.log 
    spec/schema.rb 
    spec/spec_helper.rb 
    uninstall.rb
  )
end