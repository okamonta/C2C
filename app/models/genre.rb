class Genre < ApplicationRecord
  
  has_many :users
  has_many :videos
end
