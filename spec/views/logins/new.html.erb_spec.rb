require 'rails_helper'

RSpec.describe "logins/new.html.erb", type: :view do
	it "displays the proper copy" do
		render :template => "logins/new.html.erb"
		expect(rendered).to match("login")
	end	
end
