class UsersNegotiation < ApplicationRecord
  belongs_to :user
  belongs_to :negotiation
end
