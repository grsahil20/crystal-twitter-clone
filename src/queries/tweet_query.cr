class TweetQuery < Tweet::BaseQuery

  def for_user(user : User)
    user_id(user.id)
  end
end
