# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Bugs", color: "red")
Category.create(name: "Ideas", color: "green")

if Rails.env == "development"
	u = User.new(username: "test", password: "Flywheel1!", email: "test@getflywheel.com", activated: true, admin: true, first_name: "John", last_name: "Doe")
	u.encrypt_password
	u.save

	s = Submission.create(title: "test", status_id: 1, category_id: 1, content: "Some bug", user: u)
	s.watchers << u
	c = Comment.create(user: u, submission: s, content: "stuffs")
end	
#create all the colors
color_list = [
    ['blue', false],
    ['blue-dark', false],
    ['blue-dark50', false],
    ['blue75', false],
    ['blue25', false],
    ['gray', false],
    ['gray-dark', false],
    ['gray-dark50', false],
    ['gray-75', false],
    ['gray25', false],
    ['gray15', false],
    ['gray5', false],
    ['green', false],
    ['green-dark', false],
    ['green-dark50', false],
    ['green75', false],
    ['green25', false],
    ['yellow', false],
    ['yellow-dark', false],
    ['yellow-dark50', false],
    ['yellow75', false],
    ['yellow25', false],
    ['orange', false],
    ['orange-dark', false],
    ['orange-dark50', false],
    ['orange75', false],
    ['orange25', false],
    ['red', false],
    ['red-dark', false],
    ['red-dark50', false],
    ['red75', false],
    ['red25', false],
    ['pink', false],
    ['pink-dark', false],
    ['pink-dark50', false],
    ['pink75', false],
    ['pink25', false],
    ['purple', false],
    ['purple-dark', false],
    ['purple-dark50', false],
    ['purple75', false],
    ['purple25', false]
]
color_list.each do |name, used|
    Color.create(name: name, used: used)
end

#Make Status
status_list = [
    ['Open', 1],
    ['Completed', 2],
    ['Rejected', 3]
]
status_list.each do |name, id|
    Status.create(name: name, id: id)
end
