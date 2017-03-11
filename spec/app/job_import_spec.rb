# frozen_string_literal: true
require 'spec_helper'

describe JobImport do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. file jobs_for_test.txt)) }
  let(:job_file) { JobFile.new(filepath: filepath).parse }
  let(:job_import) { JobImport.new(job_file: job_file) }
  let(:new_time) { Time.local(2017, 12, 20) }

  describe '#import' do
    before :each do
      Timecop.freeze(new_time)
      allow(Message).to receive(:publish).and_return(true)
    end

    it 'should get lines that expiration_at is greater than today' do
      expect(job_file).to receive(:expires_at_greater_than).with(Date.today).and_call_original
      job_import.import
    end
  end
end
