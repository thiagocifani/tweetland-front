class Api
  attr_reader :client, :topic

  ALL    = "all".freeze
  LATEST = "latest".freeze
  TWEETS = "tweets".freeze

  def initialize(topic = nil, client = RestClient::Request)
    @client = client
    @topic  = topic
  end

  def call
    JSON.parse(client.execute(method: :get, url: url,
                   headers: { Authorization: ENV["TWEETLAND_TOKEN"]}))
  end

  def url
    if topic
      "#{ENV["TWEETLAND_URL"]}/#{TWEETS}/#{topic}/#{LATEST}"
    else
      "#{ENV["TWEETLAND_URL"]}/#{ALL}"
    end
  end
end
