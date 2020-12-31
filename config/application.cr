class Application
  Habitat.create do
    setting name : String
    setting support_email : String
  end
end

Application.configure do |settings|
  settings.name = "c-t-c"
  settings.support_email = "no-reply@c-t-c.com"
end
