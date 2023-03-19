class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validate_uniqueness_of :role, presence: true
end
