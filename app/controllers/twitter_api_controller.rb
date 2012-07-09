class TwitterApiController < ApplicationController
  before_filter :get_client

  def get_client
    @twitter_client = Twitter::Client.new
        @twitter_client.configure do |config|
          config.oauth_token = current_user.auth_info["credentials"]["token"]
          config.oauth_token_secret = current_user.auth_info["credentials"]["secret"]
        end
  end

  def update_status
    status = @twitter_client.update(params[:message])
    current_user.twitter_jobs.create(:tweet_id => status[:id], :tweet_text => status[:text])

    flash[:notice] = "Update status with: #{params[:message]}"
    redirect_to dashboard_path
  end

  def retweet
    @twitter_client.retweet(params[:tweet_id])
    twitter_job = TwitterJob.find_by_tweet_id(params[:tweet_id])
    flash[:notice] = "Retweeted id: #{twitter_job.tweet_id}, text: #{twitter_job.tweet_text}"
    redirect_to dashboard_path
  end
end
