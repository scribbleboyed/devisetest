# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.where(email: 'admin@jobboard.com').first_or_create
admin.password = 'password'
admin.save!

board = Board.where(name: 'Tech', subdomain: 'tech', admin: admin).first_or_create

user = User.where(email: 'user@jobboard.com').first_or_create
user.password = 'password'
user.save!

employer = Employer.where(email: 'employer@jobboard.com').first_or_create
employer.password = 'password'
employer.save!

company1 = Company.where(board: board, employer: employer, name: 'Tech Company', description: 'Tech Dudes', url: 'http://www.techcompany.com').first_or_create
company2 = Company.where(board: board, employer: employer, name: 'Cat Company', description: 'Cat Dudes', url: 'http://www.catcompany.com').first_or_create

listing1 = Listing.where({
	board: board, 
	employer: employer, 
	company: company1, 
	job_title: 'Software Engineer', 
	job_description: 'Looking for seasoned Ruby of Rails developer',
	job_location: 'Los Angeles, CA',
	job_url: 'http://wwww.techcompany.com/software-engineer',
	contact_email: 'recruiter@techcompany.com'
}).first_or_create

listing2 = Listing.where({
	board: board, 
	employer: employer, 
	company: company1, 
	job_title: 'QA Engineer', 
	job_description: 'Looking for seasoned QA Engineer',
	job_location: 'Los Angeles, CA',
	job_url: 'http://wwww.techcompany.com/qa-engineer',
	contact_email: 'recruiter@techcompany.com'
}).first_or_create

listing3 = Listing.where({
	board: board, 
	employer: employer, 
	company: company2, 
	job_title: 'Cat Trainer', 
	job_description: 'Looking for seasoned cat trainer',
	job_location: 'St. Louis, MI',
	job_url: 'http://wwww.catcompany.com/cat-trainer',
	contact_email: 'recruiter@catcompany.com'
}).first_or_create

listing4 = Listing.where({
	board: board, 
	employer: employer, 
	company: company2, 
	job_title: 'Cat Groomer', 
	job_description: 'Looking for seasoned cat groomer',
	job_location: 'St Louis, MI',
	job_url: 'http://wwww.catcompany.com/cat-groomer',
	contact_email: 'recruiter@catcompany.com'
}).first_or_create

