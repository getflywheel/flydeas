require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
	describe "account_activation" do
		let(:user) { User.create(username: "testus3e4drw1", email: "test@getflywheel.com", password: "123456xX$", salt: "1234") }
		let(:mail) { UserMailer.account_activation(user) }
		
		it "renders the headers" do
			user.create_activation_digest
			expect(mail.subject).to eq("Account activation")
			expect(mail.to).to eq(["test@getflywheel.com"])
			expect(mail.from).to eq(["Flydeas@getflywheel.com"])
		end

		it "renders the body" do
			user.create_activation_digest
			expect(mail.body.encoded).to match("Account Activation")
		end
	end

	describe "notifications" do
		it "sends email" do
			notification = create(:notification)
			expect { UserMailer.notifications(notification.user).deliver_now }.to change {ActionMailer::Base.deliveries.count }.by(1)
		end
	end	
end
