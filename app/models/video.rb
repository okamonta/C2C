class Video < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre, optional: true
  
  has_many :comments, dependent: :destroy
  
  has_one_attached :video
end
