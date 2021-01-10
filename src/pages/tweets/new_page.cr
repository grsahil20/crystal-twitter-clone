class Tweets::NewPage < MainLayout
  needs save_tweet : SaveTweet

  def page_title
    "New Tweet"
  end

  def content
    link "Back to all Tweets", Tweets::Index
    mount UI::Named::Card, title: page_title, body: ->{ tweet_form(save_tweet) }
  end

  private def tweet_form(operation)
    h1 "tweet_form"
    form_for Tweets::Create do
      mount Tweets::FormFields, operation
      submit "Create Tweet"
    end
  end
end
