class Application
  Habitat.create do
    setting name : String
    setting support_email : String
  end
end

Application.configure do |settings|
  settings.name = "CTC"
  settings.support_email = "no-reply@CTC.com"
end
