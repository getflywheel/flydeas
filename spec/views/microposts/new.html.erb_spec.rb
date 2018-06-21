require 'rails_helper'

RSpec.describe "microposts/new", type: :view do
  before(:each) do
    assign(:micropost, Micropost.new(
      :Submissions => "MyString",
      :title => "MyString",
      :content => "MyText",
      :user_id => "MyString",
      :upvotes => "MyString",
      :donwvotes => "MyString"
    ))
  end

  it "renders new micropost form" do
    render

    assert_select "form[action=?][method=?]", microposts_path, "post" do

      assert_select "input#micropost_Submissions[name=?]", "micropost[Submissions]"

      assert_select "input#micropost_title[name=?]", "micropost[title]"

      assert_select "textarea#micropost_content[name=?]", "micropost[content]"

      assert_select "input#micropost_user_id[name=?]", "micropost[user_id]"

      assert_select "input#micropost_upvotes[name=?]", "micropost[upvotes]"

      assert_select "input#micropost_donwvotes[name=?]", "micropost[donwvotes]"
    end
  end
end
