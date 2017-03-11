# frozen_string_literal: true
require 'spec_helper'

describe JobImportService do
  before :each do
    allow(Message).to receive(:publish).and_return(true)
  end

  describe '::run' do
    it 'should create a JobFile object and parse it' do
      expect(JobFile).to receive(:new).and_call_original
      expect_any_instance_of(JobFile).to receive(:parse).and_call_original
      JobImportService.run
    end

    it 'should create a JobImport object and import it' do
      expect(JobImport).to receive(:new).and_call_original
      expect_any_instance_of(JobImport).to receive(:import).and_call_original
      JobImportService.run
    end
  end
end
