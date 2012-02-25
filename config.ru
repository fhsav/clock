#!/usr/bin/env rackup
# encoding: utf-8

require File.expand_path("../config/boot.rb", __FILE__)

require 'resque/server'

run Rack::URLMap.new \
  "/"       => Padrino.application,
  "/resque" => Resque::Server.new
