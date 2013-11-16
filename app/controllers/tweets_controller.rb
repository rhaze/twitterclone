class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all
	end

	def new
		@user = User.find(params[:user_id])
		@tweet = Tweet.new
	end

	def create
			@tweet = Tweet.new(tweet_params)
	    @tweet.user_id = current_user.id
	    @tweet.save!
	    flash[:info] = "Added a new tweet!"
	    redirect_to tweet_path(:id)
	end

	# def create
	# 	@tweet = Tweet.new(tweet_params)
 #    @user = User.find(params[:user_id])
 #    @tweet = @user.tweets.create(tweet_params)
 #    @tweet.user_id = current_user.id
 #    @tweet.save!
	#   flash[:info] = "Added a new tweet!"
	#   redirect_to user_path
	# end

	def show
		 @tweet = Tweet.find(session[:user_id])
	end
	

	private

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end