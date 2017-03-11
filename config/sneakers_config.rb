# frozen_string_literal: true
require 'sneakers'
require 'logger'

amqp_address = ENV['AMQP_ADDRESS'] || 'amqp://guest:guest@localhost:5672'

Sneakers.configure log: STDOUT, amqp: amqp_address
Sneakers.logger.level = Logger::INFO
