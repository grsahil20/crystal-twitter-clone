class Users::Update < BrowserAction
  route do
    user = fetch_user(user_id)

    SaveUser.update(user, params) do |operation, updated_user|
      if operation.saved?
        html Users::ShowPage, user: updated_user
      else
        html Users::EditPage, user: user, save_user: operation
      end
    end
  end

  memoize def fetch_user(user_id : String) : User
    UserQuery.new.find(user_id)
  end
end
