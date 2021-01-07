class Item < ApplicationRecord
  belongs_to :user
  belongs_to :negotiation, optional:true
end
