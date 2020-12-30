class SaveTweet < Tweet::SaveOperation
  needs user : User
  permit_columns content

  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  # permit_columns content
end
