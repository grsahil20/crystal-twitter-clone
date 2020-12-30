class Tweet < BaseModel
  table do
    column content : String

    belongs_to user : User

    belongs_to tweet : Tweet?, foreign_key: :parent_id
    has_many retweets : Tweet, foreign_key: :parent_id
  end
end
