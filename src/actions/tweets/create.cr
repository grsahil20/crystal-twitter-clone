class Tweets::Create < BrowserAction
  route do
    pp params
    SaveTweet.create(params, {user: current_user}) do |operation, tweet|
      if tweet
        flash.success = "The record has been saved"
        redirect Tweets::Show.with(tweet.id)
      else
        flash.failure = "It looks like the form is not valid"
        html Tweets::NewPage, save_tweet: operation
      end
    end
  end
end
