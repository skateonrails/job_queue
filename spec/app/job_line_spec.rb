# frozen_string_literal: true
require 'spec_helper'

describe JobLine do
  let(:input) { '1123|Vendedor|3|21/1/2017' }
  let(:json_representation) { "{\"partner_id\":1123,\"title\":\"Vendedor\",\"category_id\":3,\"expires_at\":\"2017-01-21\"}" }
  let(:job_line) { JobLine.new(input: input) }

  describe '#partner_id' do
    it 'should return the partnerId value from input' do
      expect(job_line.partner_id).to eq(1123)
    end
  end

  describe '#title' do
    it 'should return the title value from input' do
      expect(job_line.title).to eq('Vendedor')
    end
  end

  describe '#category_id' do
    it 'should return the category value from input' do
      expect(job_line.category_id).to eq(3)
    end
  end

  describe '#expires_at' do
    it 'should return the ExpiresAt value, as a date, from input' do
      expected_expires_at = Date.parse('21/1/2017')
      expect(job_line.expires_at).to eq(expected_expires_at)
    end
  end

  describe '#to_json' do
    it 'should return the representation of object in a JSON format' do
      expect(job_line.to_json).to eq(json_representation)
    end
  end
end
