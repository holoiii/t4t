class DashboardController < ApplicationController
  def index
    @user = current_user
    @our_tweets = @user.twitter_jobs
    @other_tweets = TwitterJob.where("user_id <> ?", @user.id)
  end
end
