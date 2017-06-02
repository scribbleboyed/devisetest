puts "Creating Admins"
admin1 = Admin.where(email: 'admin1@jobboard.com').first_or_create
admin1.password = 'password'
admin1.save!

admin2 = Admin.where(email: 'admin2@jobboard.com').first_or_create
admin2.password = 'password'
admin2.save!

puts "Creating Boards"
board1 = Board.where(name: 'Board1', subdomain: 'board1', admin: admin2).first_or_create
board2 = Board.where(name: 'Board2', subdomain: 'board2', admin: admin2).first_or_create

puts "Creating Users"
user1 = User.where(email: 'user1@jobboard.com').first_or_create
user1.password = 'password'
user1.save!

user2 = User.where(email: 'user2@jobboard.com').first_or_create
user2.password = 'password'
user2.save!

puts "Creating Employers"
10.times do |i|
	employer = Employer.where(email: "employer#{i}@jobboard.com").first_or_create
	employer.password = 'password'
	employer.save!
end

puts "Creating Companies"
Employer.first(5).each do |p|
	Company.create(board: board1, employer_id: p.id, name: Faker::Company.name, description: Faker::Company.catch_phrase, url: Faker::Internet.url)
end

Employer.last(5).each do |p|
	Company.create(board: board2, employer_id: p.id, name: Faker::Company.name, description: Faker::Company.catch_phrase, url: Faker::Internet.url)
end

puts "Creating Listings"
30.times do
	random_company = Company.find(rand(5)+1)
	Listing.create({
		board: random_company.board, 
		employer_id: random_company.employer_id, 
		company: random_company, 
		job_title: Faker::Job.title, 
		job_description: Faker::Lorem.paragraph,
		job_location: "#{Faker::Address.city}, #{Faker::Address.state}",
		job_url: Faker::Internet.url,
		contact_email: Faker::Internet.email
	})
end

30.times do
	random_company = Company.find(rand(5)+6)
	Listing.create({
		board: random_company.board, 
		employer_id: random_company.employer_id, 
		company: random_company,  
		job_title: Faker::Job.title, 
		job_description: Faker::Lorem.paragraph,
		job_location: "#{Faker::Address.city}, #{Faker::Address.state}",
		job_url: Faker::Internet.url,
		contact_email: Faker::Internet.email
	})
end

