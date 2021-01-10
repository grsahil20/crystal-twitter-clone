class Tweets::New < BrowserAction
  route do
    save_tweet = SaveTweet.new(current_user)
    html Tweets::NewPage, save_tweet: save_tweet
  end
end
