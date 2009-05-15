require 'rubygems'
require 'spec/rake/spectask'

task :spec do
  system "env ADAPTER=sqlite3 spec spec/"
  system "env ADAPTER=postgresql spec spec/"
end

task :default => :spec
