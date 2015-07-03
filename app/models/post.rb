class Post < ActiveRecord::Base

  mount_uploader :asset, AssetUploader

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true

  def favourited_by?(user)
    favourites.where(user: user).present?
  end

  def favourite_for(user)
    favourites.find_by_user_id(user)
  end
end
