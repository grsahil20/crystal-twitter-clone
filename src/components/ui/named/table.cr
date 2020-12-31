class UI::Named::Table < BaseComponent
  needs thead : Proc(Void)
  needs tbody : Proc(Void)

  def render
    table class: "min-w-full divide-y divide-blue-200" do
      thead.call
      tbody.call
    end
  end
end
