
$comment_ids = 1
class Comment
  attr_accessor :id, :body, :post_id, :author
  def initialize(body, author, post)
    @id = id
    $comment_ids += 1
    @body = body
    @author = author
    @post_id = post.id
    post.comments << self
  end
end
