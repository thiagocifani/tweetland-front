require "spec_helper"

describe "Manage Tweets", js:true do
  context "all" do

    it "shows tweets" do
      VCR.use_cassette("all_tweets_view") do
        visit root_path
        expect(page).to have_content "More #OpenSource goodness"
      end
    end
  end

  context "tweets about nasa" do

    it "shows tweets" do
      VCR.use_cassette("all_tweets_view_nasa") do
        visit root_path
        click_link("nasa")
        expect(page).to have_content "Bad science? Former Microsoft e"
      end
    end
  end
end
