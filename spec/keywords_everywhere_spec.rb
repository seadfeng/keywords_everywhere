RSpec.describe KeywordsEverywhere do
  it "has a version number" do
    expect(KeywordsEverywhere::VERSION).not_to be nil
  end


  it "Test Default Configuration" do
    KeywordsEverywhere.configure do |config|
      config.secret_key = 'some_key'
    end
    c = KeywordsEverywhere::Client.new 

    expect(c.market).to eq('us')
    expect(c.source).to eq('gkp')
    expect(c.currency).to eq('usd')
  end

  it "Test UK Configuration" do
    KeywordsEverywhere.configure do |config|
      config.secret_key = 'some_key'
      config.market = :uk
      config.currency = :gbp
    end
    c = KeywordsEverywhere::Client.new 

    expect(c.market).to eq('uk')
    expect(c.source).to eq('gkp')
    expect(c.currency).to eq('gbp')
  end

  it "Test Client market uk" do
    KeywordsEverywhere.configure do |config|
      config.secret_key = 'some_key'
    end
    c = KeywordsEverywhere::Client.new(market: :uk, currency: :gbp) 

    expect(c.market).to eq('uk')
    expect(c.source).to eq('gkp')
    expect(c.currency).to eq('gbp')
  end

end
