class UI::Named::CardWithFooter < BaseComponent
  needs title : String
  needs body : Proc(Void)
  needs footer : Proc(Void)

  def render
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      card_title
      card_body
      card_footer
    end
  end

  private def card_title
    div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
      h1 title, class: "font-medium text-lg"
    end
  end

  private def card_body
    div class: "border-b border-blue-200 px-4 py-5 sm:px-6" do
      body.call
    end
  end

  private def card_footer
    footer.call
  end
end
