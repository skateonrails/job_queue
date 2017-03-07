# frozen_string_literal: true
require 'date'
require 'json'

# JobLine class is the representation of a line from job.txt file
class JobLine
  def initialize(input: '')
    @input = input
  end

  def partner_id
    @partner_id ||= splitted_input[0].to_i
  end

  def title
    @title ||= splitted_input[1].to_s
  end

  def category_id
    @category_id ||= splitted_input[2].to_i
  end

  def expires_at
    @expires_at ||= Date.parse(splitted_input[3])
  end

  def to_json
    {
      partner_id: partner_id,
      title: title,
      category_id: category_id,
      expires_at: expires_at
    }.to_json
  end

  private

  def splitted_input
    @splitted_input ||= @input.split('|')
  end
end
