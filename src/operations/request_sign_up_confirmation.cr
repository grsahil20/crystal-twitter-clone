class RequestSignUpConfirmation < Avram::Operation
  include UserFromLoginId

  attribute login_id : String

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
  end
end
