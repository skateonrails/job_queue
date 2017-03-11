# frozen_string_literal: true

# JobImportService is responsible to instantiate all needed objects
# and call methods to import file
module JobImportService
  class << self
    def run
      job_import.import
    end

    private

    def job_file
      filepath = File.join(File.dirname(__FILE__), %w(.. file jobs.txt))
      job_file = JobFile.new(filepath: filepath)
      job_file.parse
    end

    def job_import
      JobImport.new(job_file: job_file)
    end
  end
end
