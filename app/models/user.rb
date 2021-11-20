class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum account: { challenger: 0, coach: 1}
         
  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :informations, dependent: :destroy
  
  belongs_to :genre, optional: true
  belongs_to :status, optional: true
  
  attachment :icon
  
  
  # 自分がフォローされる側（被フォロー）の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする側（与フォロー）の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # 自分をフォローしている人を参照。被フォロー関係を通じて、自分をフォローしている人（follower）を参照。
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローしている人を参照。与フォロー関係を通じて、自分にフォローされている人（followed）を参照。
  # 自分がフォローしている人＝自分にフォローされている人（followed）
  has_many :followings, through: :relationships, source: :followed
  
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
end
