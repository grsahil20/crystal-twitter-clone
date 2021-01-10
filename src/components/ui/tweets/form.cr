class UI::Tweets::Form < BaseComponent
  needs save_tweet : SaveTweet
  needs button_text : String

  private def render
    form_for Tweet::Create.with(save_tweet) do
      mount Shared::Field, op.name, "Body", &.text_input(autofocus: "true", placeholder: "John Doe")
      submit button_text
    end
  end

  private def table_head
    thead class: "bg-blue-50 aa" do
      th "Sr. No"
      th "Id"
      th "Content"
    end
  end

  private def table_body
    tbody class: "bg-white divide-y divide-blue-200" do
      tweets.each_with_index do |tweet, index|
        table_row(tweet, index)
      end
    end
  end

  private def table_row(tweet : Tweet, index : Int)
    tr class: "px-6 py-4 whitespace-nowrap" do
      td index + 1
      td tweet.id
      td tweet.content
    end
  end
end
