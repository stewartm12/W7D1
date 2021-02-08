# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create!(birth_date: '2000/01/20', color: 'black', name: 'robert', sex: 'F', description: 'female robert', user_id: 1)
cat2 = Cat.create!(birth_date: '2005/02/22', color: 'white', name: 'rdj', sex: 'M', description: 'iron cat', user_id: 1)
cat3 = Cat.create!(birth_date: '2015/05/20', color: 'black', name: 'roberta', sex: 'M', description: 'Male roberta', user_id: 1)

