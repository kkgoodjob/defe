class Negotiation < ApplicationRecord
  has_many :users_negotiations
  has_many :users, through: :users_negotiations
  has_many :items
  has_many :stores
  has_many :messages
  # accepts_nested_attributes_for :users_negotiation
end
