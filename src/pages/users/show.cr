class Users::ShowPage < MainLayout
  needs user : User

  def page_title
    user.name
  end

  def content
    h1 user.email
    edit_link
    # user_profile
    # user_recent_tweets
  end

  private def user_profile
    span "user_profile"
  end

  private def user_recent_tweets
    span "user_recent_tweets"
  end

  private def edit_link
    return unless user === current_user
    link "Edit", to: Users::Edit.with(user)
  end
end
