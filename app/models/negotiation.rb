class Negotiation < ApplicationRecord
  has_many :users
  has_many :items
  has_many :stores
  has_many :messages
end
