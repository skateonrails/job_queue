# frozen_string_literal: true
require 'sneakers'
require 'json'

# Queue is responsible to send json to RabbitMQ.
# It acts as a layer above Sneakers gem.
module Message
  QUEUE_NAME = :job_import

  def self.publish(input_line)
    Sneakers::Publisher.new.publish(input_line.to_json, to_queue: QUEUE_NAME)
  end
end
