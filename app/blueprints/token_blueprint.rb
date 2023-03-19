# frozen_string_literal: true

# Defines JSON blueprint for token model
class TokenBlueprint < Blueprinter::Base
  identifier :id
  fields :expiry, :ip, :revocation_date, :value, :created_at, :updated_at, :user_id
end
