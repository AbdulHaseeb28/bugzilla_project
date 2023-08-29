# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
manager = User.create(email: 'manager@example.com', encrypted_password: 'password', user_type: 'manager', username: 'manager_user')
developer = User.create(email: 'developer@example.com', encrypted_password: 'password', user_type: 'developer', username: 'developer_user')
qa = User.create(email: 'qa@example.com', encrypted_password: 'password', user_type: 'qa', username: 'qa_user')
# Create projects
project1 = Project.create(name: 'Project 1')
project2 = Project.create(name: 'Project 2')
# Assign users to projects
ProjectUser.create(project: project1, user: manager)
ProjectUser.create(project: project1, user: developer)
ProjectUser.create(project: project1, user: qa)
ProjectUser.create(project: project2, user: qa)
# Create bugs
bug1 = Bug.create(title: 'Critical Bug', status: 'new', type: 'bug', project: project1)
bug2 = Bug.create(title: 'Feature Request', status: 'started', type: 'feature', project: project1)
bug3 = Bug.create(title: 'UI Issue', status: 'new', type: 'bug', project: project2)
