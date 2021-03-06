class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save!
    flash[:info] = "Added a new tweet!"
    redirect_to tweet_path(:id)
	end

	def show
		 @tweet = Tweet.find(session[:user_id])
	end
	

	private

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end