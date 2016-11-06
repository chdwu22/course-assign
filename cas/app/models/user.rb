class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :full_name, :uniqueness => {:case_sensitive => false}
end
