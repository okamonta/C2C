class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum account: { challenger: 0, coach: 1}
         
  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :informations, dependent: :destroy
  
  belongs_to :genre
  belongs_to :status
end
