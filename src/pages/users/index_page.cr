class Users::IndexPage < MainLayout
  needs users : UserQuery
  needs pages : Lucky::Paginator

  def page_title
    "Users"
  end

  def content
    mount UI::Named::CardWithFooter, title: "Users", body: ->{ users_table }, footer: ->{ page_footer }
  end

  private def users_table
    mount UI::Users::Table, users: users
  end

  private def page_footer
    mount Lucky::Paginator::BootstrapNav, pages
    mount Lucky::Paginator::BulmaNav, pages
  end
end
