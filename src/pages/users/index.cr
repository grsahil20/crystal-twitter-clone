class Users::IndexPage < MainLayout
  needs users : UserQuery
  needs pages : Lucky::Paginator

  def page_title
    "Users"
  end

  def content
    mount UI::Named::CardWithFooter, title: "Users", body: ->{ users_table }, footer: ->{ page_footer }
  end

  private def page_footer
    mount Lucky::Paginator::SimpleNav, pages
  end

  private def users_table
    # users_table_head
    # users_table_body
    mount UI::Users::Table, users: users
  end

  private def users_table_head
    thead class: "bg-blue-50 aa" do
      th "Sr. No"
      th "Id"
      th "Email"
    end
  end

  private def users_table_body
    tbody class: "bg-white divide-y divide-blue-200" do
      users.each_with_index do |user, index|
        user_table_row(user, index)
      end
    end
  end

  private def user_table_row(user : User, index : Int)
    tr class: "px-6 py-4 whitespace-nowrap" do
      td index + 1
      td do
        link user.id, to: Users::Show.with(user)
      end
      td user.email
    end
  end
end
