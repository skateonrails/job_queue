# frozen_string_literal: true
root_path = File.dirname(__FILE__)

config_path = [root_path, 'config'].freeze
require File.join(config_path, 'sneakers_config.rb')

app_path = [root_path, 'app'].freeze
require File.join(app_path, 'job_line.rb')
require File.join(app_path, 'job_file.rb')
require File.join(app_path, 'message.rb')
require File.join(app_path, 'job_import.rb')
require File.join(app_path, 'job_import_service.rb')
