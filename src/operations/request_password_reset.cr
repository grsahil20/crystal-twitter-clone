class RequestPasswordReset < Avram::Operation
  # You can modify this in src/operations/mixins/user_from_email.cr
  include UserFromLoginId

  attribute login_id : String

  # Run validations and yield the operation and the user if valid
  def run
    user = user_from_login_id
    validate(user)

    if valid?
      user
    else
      nil
    end
  end

  def validate(user : User?)
    validate_required login_id
    if user.nil?
      login_id.add_error "is not in our system"
    end
  end
end
