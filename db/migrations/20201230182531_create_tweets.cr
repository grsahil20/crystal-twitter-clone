class CreateTweets::V20201230182531 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create :tweets do
      primary_key id : UUID
      add_timestamps
      add content : String

      add_belongs_to user : User, on_delete: :cascade, foreign_key_type: UUID
      add_belongs_to parent : Tweet?, on_delete: :cascade, foreign_key_type: UUID
    end
  end

  def rollback
    drop table_for(Tweet)
  end
end
