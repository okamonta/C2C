class Video < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  
  has_many :comments, dependent: :destroy
  
  has_one_attached :video
end
