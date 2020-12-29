class PopulateUserNames::V20201228193503 < Avram::Migrator::Migration::V1
  def migrate
    UserQuery.new.each do |user|
      name = user.email.split('@').first
      user_name = [name, user.id].join('_')
      # SaveUser.update!(user, name: name, user_name: user_name)
    end
  end

  def rollback
  end
end
