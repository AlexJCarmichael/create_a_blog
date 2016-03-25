
$comment_ids = 1
class Comment
  attr_accessor :id, :body, :post_id, :author
  def initialize(body, author, post)
    @id = $comment_ids
    $comment_ids += 1
    @body = body
    @author = author
    @post_id = post.id
    post.comments << self
  end

  def to_json(_ = nil)
    {
      id: id,
      body: body,
      author: author,
      post_id: post_id
    }.to_json
  end
end
