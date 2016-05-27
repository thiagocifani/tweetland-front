class Tweet
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def id
    content["id"]
  end

  def handle
    content["handle"]
  end

  def text
    content["tweet_content"]
  end

  def topic
    content["topic"]
  end

  def photo
    content["user_photo_url"]
  end

  def retweets
    content["retweet_count"]
  end

  def favorites
    content["favorite_count"]
  end

  def created_at
    content["created_at"]
  end

  def tweet_id
    content["tweet_id"]
  end
end
