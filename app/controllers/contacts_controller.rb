
class ContactsController < ApplicationController
  def index
    render_template "contacts/index.html.erb"
  end
end
