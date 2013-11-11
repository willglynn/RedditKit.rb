require 'spec_helper'

describe RedditKit::Link do

  before :all do
    attributes = { :data => { :id => '12345', :url => 'http://example.com/test.png', :permalink => 'permalink', :created_utc => Time.now.to_i } }
    @link = RedditKit::Link.new attributes

    old_link_attributes = { :data => { :id => '12345', :url => 'http://example.com/test.png', :created_utc => Time.new(2000, 1, 1).to_i } }
    @old_link = RedditKit::Link.new old_link_attributes
  end

  it "does not show the score for new links" do
    expect(@link.showing_link_score?).to be_false
  end

  it "shows the score for old links" do
    expect(@old_link.showing_link_score?).to be_true
  end

  it "determines whether the link has an image extension" do
    expect(@link.image_link?).to be_true
  end

  it "returns the link's permalink" do
    expect(@link.permalink).to eq 'http://reddit.com/permalink'
  end

  it "returns the link's short URL" do
    expect(@link.short_link).to eq 'http://redd.it/12345'
  end

end
