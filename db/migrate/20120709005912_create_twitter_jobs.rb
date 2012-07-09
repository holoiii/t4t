class CreateTwitterJobs < ActiveRecord::Migration
  def change
    create_table :twitter_jobs do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
