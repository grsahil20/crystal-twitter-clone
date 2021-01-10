class Tweets::FormFields < BaseComponent
  needs operation : SaveTweet

  def render
    mount Shared::Field, operation.content, &.text_input(autofocus: "true")
  end
end
