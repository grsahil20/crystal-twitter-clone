class Me::ShowPage < MainLayout
  def page_title
    "Profile"
  end

  def content
    mount UI::Named::Card, title: "Your profile", body: ->{ profile }
  end

  private def profile
    h3 "Email:  #{current_user.email}"
  end
end
