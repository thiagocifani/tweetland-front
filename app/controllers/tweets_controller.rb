class TweetsController < ApplicationController
  def index
    return @tweets = Api.new.call.map { |tweet| Tweet.new(tweet) } unless params[:q]

    @tweets = Api.new(params[:q]).call.map { |tweet| Tweet.new(tweet) }
  end
end
