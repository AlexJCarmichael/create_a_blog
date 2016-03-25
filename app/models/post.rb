
$id_given = 1
class Post
  attr_accessor :id, :title, :author, :body, :published, :comments
  def initialize(title, author, body)
    @id = $id_given
    $id_given += 1
    @title = title
    @author = author
    @body = body
    @published = false
    @comments = []
  end

  def to_json(_ = nil)
   {
    id: id,
    title: title,
    author: author,
    body: body,
    published: published,
    comments: comments
    }.to_json
  end
end
