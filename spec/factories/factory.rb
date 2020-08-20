def random_int
	Random.rand(1000).to_s
end

FactoryBot.define do
	sequence :email do |n|
		"person#{n}@getflywheel.com"
	end

	sequence :username do |n|
		"user#{n}"
	end

    factory :user do
        username
        email
        activated true
        password 'Flywheel1!'
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

	factory :vote do
		post factory: :submission
		user factory: :user
		post_type "Submission"
		weight 0
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

	factory :watcher do
		user factory: :user
		submission factory: :submission
	end

	factory :post_change do
		change_object factory: :comment 
		submission factory: :submission
		post_change_type "comment"

		factory :status_post_change do
			post_change_type "status"
		end

		factory :vote_post_change do
			post_change_type "vote"	
		end
	end

	factory :notification do
		user factory: :user
		post_change factory: :post_change
	end
end
