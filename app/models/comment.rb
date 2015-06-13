class Comment < ActiveRecord::Base


  validates :body, presence: true, uniqueness: { scope: :post_id }

  belongs_to :post

  def self.search id
    Comment.where("post_id = #{id}").order("created_at desc")
  end

end
