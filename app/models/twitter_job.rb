class TwitterJob < ActiveRecord::Base
  belongs_to :user

  validates :tweet_id, :tweet_text, :presence => :true
end
