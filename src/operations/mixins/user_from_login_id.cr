module UserFromLoginId
  private def user_from_login_id : User?
    login_id_value = login_id.value
    return unless login_id_value
    UserQuery.new.email(login_id_value).first? || UserQuery.new.user_name(login_id_value).first?
  end
end
