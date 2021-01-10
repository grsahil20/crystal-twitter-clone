class Tweets::IndexPage < MainLayout
  needs tweets : TweetQuery
  needs pages : Lucky::Paginator

  def page_title
    "Tweets"
  end

  def content
    mount UI::Named::CardWithFooterAndHeader,
      header: ->{ header },
      body: ->{ tweets_table },
      footer: ->{ page_footer }
  end

  private def header
    h1 page_title, class: "font-medium text-lg"
    div class: "hidden sm:flex sm:space-x-2 items-center" do
      link "New Tweet", to: Tweets::New, class: "text-sm font-medium text-gray-900 hover:text-gray-600"
    end
  end

  private def tweets_table
    mount UI::Tweets::Table, tweets: tweets
  end

  private def page_footer
    mount Lucky::Paginator::BootstrapNav, pages
    mount Lucky::Paginator::BulmaNav, pages
  end
end
