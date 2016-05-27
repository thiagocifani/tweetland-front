require "spec_helper"

describe Tweet do
  let(:tweet_json) { {"id" => 1, "handle" => "thiagocifani", "tweet_content" => "Yolo"} }

  subject { Tweet.new(tweet_json) }

  context "tweet json" do

    it "returns object with all content" do
      expect(subject.id).to eq 1
      expect(subject.handle).to eq "thiagocifani"
      expect(subject.text).to eq "Yolo"
    end
  end
end
