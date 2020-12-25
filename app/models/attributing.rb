class Attributing < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '支援者' },
    { id: 3, name: '依頼者' }
  ]
  
  include ActiveHash::Associations
  has_many :users
end