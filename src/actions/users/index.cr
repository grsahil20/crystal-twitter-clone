class Users::Index < BrowserAction
  route do
    pages, users = paginate(UserQuery.new, per_page: 50)
    html Users::IndexPage, users: users, pages: pages
  end

  def page_title
    "List of users"
  end
end
