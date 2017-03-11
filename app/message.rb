# frozen_string_literal: true
require 'sneakers'
require 'json'

# Queue is responsible to send json to RabbitMQ.
# It acts as a layer above Sneakers gem.
module Message
  QUEUE_NAME = :job_import

  def self.publish(input_line)
    queue = ENV['QUEUE_NAME'] || QUEUE_NAME
    Sneakers::Publisher.new.publish(input_line.to_json, to_queue: queue)
  end
end
