# frozen_string_literal: true
require 'sneakers'
require 'logger'

amqp_address = ENV['AMQP_ADDRESS'] || 'amqp://guest:guest@localhost:5672'

config = {
  durable: true,
  heartbeat: 2,
  exchange: 'sneakers',
  log: STDOUT,
  amqp: amqp_address
}

Sneakers.configure config
Sneakers.logger.level = Logger::INFO
