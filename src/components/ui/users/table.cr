class UI::Users::Table < BaseComponent
  needs users : UserQuery

  def render
    mount UI::Named::Table, thead: ->{ users_table_head }, tbody: ->{ users_table_body }
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
      td { link user.user_name, to: ::Users::Show.with(user_id: user.user_name) }
      td user.email
    end
  end
end
