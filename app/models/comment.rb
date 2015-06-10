class Comment < ActiveRecord::Base


  validates :body, presence: true, uniqueness: { scope: :post_id }

  belongs_to :post

end
