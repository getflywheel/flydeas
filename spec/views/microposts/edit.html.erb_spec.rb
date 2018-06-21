require 'rails_helper'

RSpec.describe "microposts/edit", type: :view do
  before(:each) do
    @micropost = assign(:micropost, Micropost.create!(
      :Submissions => "MyString",
      :title => "MyString",
      :content => "MyText",
      :user_id => "MyString",
      :upvotes => "MyString",
      :donwvotes => "MyString"
    ))
  end

  it "renders the edit micropost form" do
    render

    assert_select "form[action=?][method=?]", micropost_path(@micropost), "post" do

      assert_select "input#micropost_Submissions[name=?]", "micropost[Submissions]"

      assert_select "input#micropost_title[name=?]", "micropost[title]"

      assert_select "textarea#micropost_content[name=?]", "micropost[content]"

      assert_select "input#micropost_user_id[name=?]", "micropost[user_id]"

      assert_select "input#micropost_upvotes[name=?]", "micropost[upvotes]"

      assert_select "input#micropost_donwvotes[name=?]", "micropost[donwvotes]"
    end
  end
end
