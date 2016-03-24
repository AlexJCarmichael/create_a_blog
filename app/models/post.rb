
$ids_given = 0
class Post
  attr_accessor :id, :title, :author, :body, :published
  def initialize(title, author, body)
    @id = this_assigns_an_id_at_creation
    @title = title
    @author = author
    @body = body
    @published = true
  end

  def to_json(_ = nil)
   {
    id: id,
    title: title,
    author: author,
    body: body,
    published: published
    }.to_json
  end

  def this_assigns_an_id_at_creation
    $ids_given +=1
  end
end
