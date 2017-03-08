# frozen_string_literal: true
# JobImportService is responsible to send the lines to RabbitMQ
# According to the challenge, it must import lines that expiration_at
# is greater than import date and it must import only 80% of lines
# from the file
class JobImportService
  def initialize(job_file:)
    @job_file = job_file
  end

  def import
    lines_to_import
  end

  private

  attr_accessor :job_file

  def lines_to_import
    @lines_to_import ||= job_file.expires_at_greater_than(Date.today)
  end
end
