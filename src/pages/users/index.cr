class Users::IndexPage < MainLayout
  needs users : UserQuery
  needs pages : Lucky::Paginator

  def page_title
    "Users"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      page_header
      page_body
      page_footer
    end
  end

  private def page_header
    div class: "border-b border-blue-200 px-4 py-5 sm:px-6" do
      h1 "Users", class: "font-medium text-lg"
    end
  end

  private def page_body
    div class: "border-b border-blue-200 px-4 py-5 sm:p-6" do
      all_users_table
    end
  end

  private def page_footer
    mount Lucky::Paginator::SimpleNav, pages
  end

  private def all_users_table
    table class: "min-w-full divide-y divide-blue-200" do
      users_table_head
      users_table_body
    end
  end

  private def users_table_head
    thead class: "bg-blue-50" do
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
