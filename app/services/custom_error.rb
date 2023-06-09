# frozen_string_literal: true

# used to generate custom error messages
class CustomError
  def initialize(message = nil)
    @errors = []
    @errors << message unless message.blank?
  end

  def add(message)
    raise_if_no_message_provided(message)
    @errors << message
    self
  end

  def size
    @errors.size
  end

  def none?
    size.zero?
  end

  def all
    @errors
  end

  def as_sentence
    @errors.to_sentence.capitalize
  end

  def convert(errors)
    class_type = errors.class.to_s
    messages = []

    messages = errors.full_messages if class_type == "ActiveModel::Errors"

    messages = errors if class_type == "Array"

    messages = errors&.errors&.full_messages || [] unless class_type.in?(%w[Array ActiveModel::Errors])

    messages.each { |error| @errors << error }
  end

  private

  def raise_if_no_message_provided(message)
    raise "Must provide an error message!" if message.blank?
  end
end