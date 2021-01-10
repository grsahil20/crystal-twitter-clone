class UI::Named::CardWithFooterAndHeader < BaseComponent
  needs header : Proc(Void)
  needs body : Proc(Void)
  needs footer : Proc(Void)

  def render
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      card_header
      card_body
      card_footer
    end
  end

  private def card_header
    div class: "border-b border-gray-200 py-5 sm:px-6" do
      header.call
    end
  end

  private def card_body
    div class: "border-b border-blue-200 py-5 sm:px-6" do
      body.call
    end
  end

  private def card_footer
    footer.call
  end
end
