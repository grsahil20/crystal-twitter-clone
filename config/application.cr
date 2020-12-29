class Application
  Habitat.create do
    setting name : String
    setting support_email : String
  end
end

Application.configure do |settings|
  settings.name = "crystal-twitter-clone"
  settings.support_email = "no-reply@crystal-twitter-clone.com"
end
