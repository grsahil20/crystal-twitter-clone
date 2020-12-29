class Users::Edit < BrowserAction
  route do
    user = fetch_user(user_id)
    save_user = SaveUser.new(user)

    html Users::EditPage, user: user, save_user: save_user
  end

  memoize def fetch_user(user_id : String) : User
    UserQuery.new.find(user_id)
  end
end
