def random_int
	Random.rand(1000).to_s
end

FactoryBot.define do
	factory :user do
		username { "test#{random_int}" }
		email "test#{random_int}@getflywheel.com"
		activated true
		password "Flywheel1!"
		after(:build) { |user| user.encrypt_password }
	end

	factory :invalid_user do
		username { nil }
		email nil
		activated false
		password nil
		after(:build) { |user| user.encrypt_password }
	end

	factory :category do
		name "some category"
	end

	factory :status do
		name "test"
	end

	factory :submission do
		title "some submission#{random_int}"
		content "some info about idea/bug#{random_int}"
		category factory: :category
		status factory: :status
		user factory: :user
	end

	factory :invalid_submission do
		title nil
		content nil
		category factory: :category
		status factory: :status
		invalid_user factory: :user
	end

	factory :comment do
		content "some comment"
		submission factory: :submission
		parent_comment nil
		user factory: :user
	end
end
