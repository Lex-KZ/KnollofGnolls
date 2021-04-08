# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "terminal-table", "~> 2.0" 
gem "colorize", "~> 0.8.1"
gem "rspec", "~> 1.8.7"
gem "tty-prompt", "~>0.23.0"
