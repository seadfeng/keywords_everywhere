RSpec.describe KeywordsEverywhere::List do
    # it "Search Two Keywords" do
    #   KeywordsEverywhere.configure do |config|
    #         config.secret_key = ENV['KW_SECRET']
    #   end
    #   expect(KeywordsEverywhere.secret_key).not_to be nil
    #   c = KeywordsEverywhere::Client.new
    #   c.search_items(['nike','hp'])
    #   list = c.list
    #   expect(c.response).not_to be nil
    #   expect(list.size).not_to be 0 
    # end

    it "Matching Error: Search Keywords More than 100" do

        c = KeywordsEverywhere::Client.new
        keywords = (0...101).to_a.map(&:to_s) 
        expect{c.search_items(keywords)}.to raise_error(StandardError)
    end
end