# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "bugs")

Status.create(name: "closed")
Status.create(name: "open")
Status.create(name: "completed")

if Rails.env == "development"
	u = User.new(username: "test", password: "Flywheel1!", email: "test@getflywheel.com", activated: true)
	u.encrypt_password
	u.save

	s = Submission.create(title: "test", status_id: 1, category_id: 1, content: "Some bug", user: u)
	s.watchers << u
	c = Comment.create(user: u, submission: s, content: "stuffs")
end	
