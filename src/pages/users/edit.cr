class Users::EditPage < MainLayout
  needs user : User
  needs save_user : SaveUser

  def page_title
    "Edit"
  end

  def content
    h1 user.email
    user_form(save_user)
  end

  private def user_form(op)
    form_for Users::Update.with(user) do
      mount Shared::Field, op.name, "Name", &.text_input(autofocus: "true", placeholder: "John Doe")
      mount Shared::Field, op.user_name, "Handle", &.text_input(disabled: "true", placeholder: "johndoe", hint: "like johndoe")
      mount Shared::Field, op.email, "Email", &.email_input(disabled: "true", placeholder: "johndoe@example.com")
      submit "Save User"
    end
  end
end
