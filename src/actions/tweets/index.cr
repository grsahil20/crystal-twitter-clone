class Tweets::Index < BrowserAction
  route do
    pages, tweets = paginate(TweetQuery.new, per_page: 50)
    html Tweets::IndexPage, tweets: tweets, pages: pages
  end

  def page_title
    "Tweets"
  end
end
