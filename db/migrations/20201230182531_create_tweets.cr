class CreateTweets::V20201230182531 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create :tweets do
      primary_key id : UUID
      add_timestamps
      add content : String

      add user_id : UUID
      add parent_id : UUID?
    end
  end

  def rollback
    drop table_for(Tweet)
  end
end
