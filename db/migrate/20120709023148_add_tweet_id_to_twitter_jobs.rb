class AddTweetIdToTwitterJobs < ActiveRecord::Migration
  def change
    add_column :twitter_jobs, :tweet_id, :string
    add_column :twitter_jobs, :tweet_text, :string
  end
end
