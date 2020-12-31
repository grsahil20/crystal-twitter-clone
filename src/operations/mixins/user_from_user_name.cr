module UserFromUserName
  private def user_from_user_name : User?
    email.value.try do |value|
      UserQuery.new.user_name(value).first?
    end
  end
end
