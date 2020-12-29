class Users::Show < BrowserAction
  route do
    user = fetch_user(user_id)

    html Users::ShowPage, user: user
  end

  def page_title
    user.id + " | " + user.email
  end

  memoize def fetch_user(user_id : String) : User
    UserQuery.new.find(user_id)
  end
end
