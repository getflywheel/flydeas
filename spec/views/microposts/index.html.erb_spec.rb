require 'rails_helper'

RSpec.describe "microposts/index", type: :view do
  before(:each) do
    assign(:microposts, [
      Micropost.create!(
        :category => "Category",
        :title => "Title",
        :content => "MyText",
        :user_id => "User",
        :upvotes => "Upvotes",
        :donwvotes => "Donwvotes"
      ),
      Micropost.create!(
        :category => "Category",
        :title => "Title",
        :content => "MyText",
        :user_id => "User",
        :upvotes => "Upvotes",
        :donwvotes => "Donwvotes"
      )
    ])
  end

  it "renders a list of microposts" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Upvotes".to_s, :count => 2
    assert_select "tr>td", :text => "Donwvotes".to_s, :count => 2
  end
end
