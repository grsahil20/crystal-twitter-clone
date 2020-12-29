class Shared::FieldHint(T) < BaseComponent
  needs attribute : Avram::PermittedAttribute(T)
  needs hint_text : String?

  def render
    return unless hint_text
    para class: "ml-2 mt-1 text-xs italic pt-2" do
      span "#{hint_text}"
    end
  end
end
