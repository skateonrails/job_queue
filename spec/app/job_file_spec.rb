# frozen_string_literal: true
require 'spec_helper'

describe JobFile do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. .. file jobs.txt)) }
  let(:job_file) { JobFile.new(filepath: filepath) }

  it 'should act as an array of JobLine objects' do
    job_file.each do |object|
      expect(object).to respond_to(:partner_id)
      expect(object).to respond_to(:title)
      expect(object).to respond_to(:category_id)
      expect(object).to respond_to(:expires_at)
      expect(object).to respond_to(:to_json)
    end
  end

  it 'should not parse the header of file' do
    first_line = job_file.first
    expect(first_line.partner_id).to eq(1123)
    expect(first_line.title).to eq('Vendedor')
    expect(first_line.category_id).to eq(3)
    expect(first_line.expires_at).to eq(Date.parse('21/1/2017'))
  end
end
