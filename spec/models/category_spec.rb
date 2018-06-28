require 'rails_helper'

RSpec.describe Category, type: :model do
   it "is valid with valid attributes" do
        category = Category.new
        category.name = "bugs"
        expect(category).to be_valid
    end 
    
    it "is invalid without name" do
        category = Category.new
        expect(category).to_not be_valid 
    end 

    it "can have children submissions" do
        category = Category.new(name: "bugs")
        category.save
        user = User.new(username: "test", password: "1234", 
                        email: "test@getflywheel.com", activated: true)
        user.encrypt_password
        user.save
        submission1 = Submission.new(title: "some bug1", content: "some info", 
                                        category: category, user: user)
        submission2 = Submission.new(title: "some bug2", content: "more info",
                                        category: category, user: user) 
        submission1.save
        submission2.save
        bug_submissions = Submission.where(category: category) 
        #binding.pry
        expect(bug_submissions[0].title).to eq("some bug1")
        expect(bug_submissions[1].title).to eq("some bug2")
        expect(category).to be_valid
    end
end
