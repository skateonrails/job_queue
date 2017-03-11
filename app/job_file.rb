# frozen_string_literal: true

# JobFile is responsible to parse a txt file into JobLine objects.
# According to the challenge, it must import just 80% of job lines
# found in file.
class JobFile
  include Enumerable
  extend Forwardable

  HEADER = 'partnerId|title|categoryId|ExpiresAt'
  IMPORT_PERCENTAGE = 0.8

  def initialize(filepath: nil)
    @filepath = filepath
    @lines = []
  end

  def_delegators :lines, :each, :first, :size

  def parse
    lines_to_import.each do |file_line|
      lines << JobLine.new(input: file_line)
    end

    self
  end

  def expires_at_greater_than(date)
    lines.find_all { |job_line| job_line.expires_at > date }
  end

  private

  attr_accessor :filepath, :lines

  def file
    @file ||= File.new(filepath)
  end

  def file_lines
    @file_lines ||= file.readlines
  end

  def sanitized_lines
    @sanitized_lines ||= file_lines.map(&:chomp)
  end

  def job_lines
    @job_lines ||= sanitized_lines.reject { |line| line == HEADER }
  end

  def lines_to_import
    total = job_lines.size
    last_element_index = (total * IMPORT_PERCENTAGE).ceil
    job_lines[0...last_element_index].to_a
  end
end
