#require "bundler/gem_tasks"
#task :default => :spec

task :console do 
	require './config/environment'

	center = Center.new
	center.name = "Recycling Center N1"
	center.save


	Pry.start
end