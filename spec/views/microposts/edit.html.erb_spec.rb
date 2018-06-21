require 'rails_helper'

RSpec.describe "microposts/edit", type: :view do
  before(:each) do
    @micropost = assign(:micropost, Micropost.create!(
      :category => "MyString",
      :title => "MyString",
      :content => "MyText",
      :user_id => "MyString",
      # TODO find a way to test upvotes and downvotes
      :upvotes => "MyString",
      :donwvotes => "MyString"
    ))
  end

  it "renders the edit micropost form" do
    render

    assert_select "form[action=?][method=?]", micropost_path(@micropost), "post" do

      assert_select "input#micropost_categoryname=?]", "micropost[category]"

      assert_select "input#micropost_title[name=?]", "micropost[title]"

      assert_select "textarea#micropost_content[name=?]", "micropost[content]"

      assert_select "input#micropost_user_id[name=?]", "micropost[user_id]"
    end
  end
end
