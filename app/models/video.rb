class Video < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre, optional: true
  
  has_many :comments, dependent: :destroy
  
  has_one_attached :video
  
  def self.search_for(genre_id)
    if genre_id == 3
      Video.where(name: genre_id)
    end
  end

end
