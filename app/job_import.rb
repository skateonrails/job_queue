# frozen_string_literal: true
# JobImport is responsible to send the lines to RabbitMQ
# According to the challenge, it must import lines that expiration_at
# is greater than import date.
class JobImport
  def initialize(job_file:)
    @job_file = job_file
  end

  def import
    lines_to_import.each do |job_line|
      Message.publish(job_line)
    end
  end

  private

  attr_accessor :job_file

  def lines_to_import
    @lines_to_import ||= job_file.expires_at_greater_than(Date.today)
  end
end
