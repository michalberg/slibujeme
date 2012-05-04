#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Slibujeme::Application.load_tasks

require 'annotate'

ENV['position']            = "after"
ENV['show_indexes']        = "true"
ENV['include_version']     = "true"
ENV['exclude_tests']       = "true"
ENV['exclude_fixtures']    = "true"

task(:default).clear
task :default => ["db:migrate", "db:test:prepare", :cucumber, :spec]
