# frozen_string_literal: true
require 'spec_helper'

describe JobImportService do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. file jobs_for_test.txt)) }
  let(:job_file) { JobFile.new(filepath: filepath) }
  let(:job_import) { JobImportService.new(job_file: job_file) }
  let(:new_time) { Time.local(2017, 12, 20) }

  describe '#import' do
    before :each do
      Timecop.freeze(new_time)
    end

    it 'should get lines that expiration_at is greater than today' do
      expect(job_file).to receive(:expires_at_greater_than).with(Date.today)
      job_import.import
    end

    xit 'should get only 80% of the jobs from lines' do

    end
  end
end
