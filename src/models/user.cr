class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  include Users::EmailConfirmable

  table do
    column email : String
    column name : String
    column user_name : String
    column encrypted_password : String

    has_many tweets : Tweet, foreign_key: :parent_id
    has_many retweets : Tweet, foreign_key: :parent_id

    has_many tweet_retweets : Tweet, through: [:tweets, :retweets]
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
