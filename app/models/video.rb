class Video < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  
  has_many :videos, dependent: :destroy
end
