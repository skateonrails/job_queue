# frozen_string_literal: true

# JobFile is responsible to parse a txt file into JobLine objects
class JobFile
  include Enumerable
  extend Forwardable

  HEADER = 'partnerId|title|categoryId|ExpiresAt'

  def initialize(filepath: nil)
    @filepath = filepath
    @lines = []
    parse_lines
  end

  def_delegators :lines, :each, :first

  def expires_at_greater_than(date)
    lines.find_all { |job_line| job_line.expires_at > date }
  end

  private

  attr_accessor :filepath, :lines

  def parse_lines
    file.each_line do |file_line|
      sanitized_line = file_line.chomp

      next if sanitized_line == HEADER
      lines << JobLine.new(input: sanitized_line)
    end
  end

  def file
    File.new(filepath)
  end
end
