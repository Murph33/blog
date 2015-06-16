class Category < ActiveRecord::Base

  has_many :posts, dependent: :nullify
  validates_presence_of: :title

end
