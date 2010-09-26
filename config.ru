#!/usr/bin/env ruby

### Clock.
###   file: config.ru

### Set directory variable.
directory = File.expand_path(File.dirname(__FILE__))

### Require system dependencies.
require 'rubygems'
require 'bundler/setup'

### Require application depedencies.
require 'sinatra'
require 'datamapper'
require 'dm-sqlite-adapter'
require 'dm-serializer'
require 'grit'
require 'active_support'

require 'shoulda'
require 'mocha'
require 'jeweler'

require 'ostruct'

### Require the application file.
require File.join(directory, 'app', 'clock.rb')

### Run the application.
run Sinatra::Application
