class Tweets::Show < BrowserAction
  route do
    tweet = fetch_tweet(tweet_id)
    save_tweet = SaveTweet.new(user: current_user)

    html Tweets::NewPage, save_tweet: save_tweet
  end

  memoize def fetch_tweet(tweet_id : String) : Tweet
    TweetQuery.new.find(tweet_id)
  end
end
