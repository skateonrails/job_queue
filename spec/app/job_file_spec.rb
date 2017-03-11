# frozen_string_literal: true
require 'spec_helper'

describe JobFile do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. file jobs_for_test.txt)) }
  let(:job_file) { JobFile.new(filepath: filepath) }

  describe '#parse' do
    before :each do
      job_file.parse
    end

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

    it 'should get only 80% of the jobs from file' do
      lines_size = File.open(filepath, 'r').readlines.size - 1 #removing header
      total_imported_lines = (lines_size * 0.8).ceil
      expect(job_file.size).to eq(total_imported_lines)
    end
  end

  describe '#expires_at_greater_than' do
    it 'should return an empty array if does not find lines with condition' do
      date = Date.parse('20/12/2019')
      lines = job_file.parse.expires_at_greater_than(date)
      expect(lines).to be_empty
    end

    it 'should return lines that expires_at is greater than date passed as argument' do
      date = Date.parse('20/12/2017')
      lines = job_file.parse.expires_at_greater_than(date)
      expect(lines.first.partner_id).to eq(4435)
    end
  end
end
