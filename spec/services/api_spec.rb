require 'spec_helper'

describe Api do
  subject { Api.new }

  context 'all' do
    it 'retuns all topics 10 tops tweets' do
      VCR.use_cassette("tweets_all") do
        expect(subject.call).to_not be_nil
        expect(subject.call.size).to eq 10
      end
    end
  end

  context 'topic' do
    subject { Api.new("nasa") }

    it 'retuns only nasa tweets' do
      VCR.use_cassette("tweets_by_topic") do
        expect(subject.call.map{|tweet| tweet["topic"]}.uniq.first).to eq "nasa"
      end
    end
  end
end
