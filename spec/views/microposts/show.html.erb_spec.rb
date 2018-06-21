require 'rails_helper'

RSpec.describe "microposts/show", type: :view do
  before(:each) do
    @micropost = assign(:micropost, Micropost.create!(
      :category => "Category",
      :title => "Title",
      :content => "MyText",
      :user_id => "User",
      :upvotes => "Upvotes",
      :donwvotes => "Donwvotes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Upvotes/)
    expect(rendered).to match(/Donwvotes/)
  end
end
