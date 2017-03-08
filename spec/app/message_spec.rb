# frozen_string_literal: true
require 'spec_helper'

describe Message do
  let(:input_line) { instance_double('JobLine') }
  let(:queue_name) { Message::QUEUE_NAME }

  before :each do
    allow_any_instance_of(Sneakers::Publisher).to receive(:publish).with(input_line.to_json, to_queue: queue_name).and_return(true)
  end

  describe '::publish' do
    it 'should call publish on Sneakers gem' do
      expect_any_instance_of(Sneakers::Publisher).to receive(:publish).with(input_line.to_json, to_queue: queue_name).and_return(true)

      Message.publish(input_line)
    end
  end
end
