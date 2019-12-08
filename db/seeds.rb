house = Establishment.find_or_create_by(name: "house")


daniel = Occupant.find_or_create_by(name: "Daniel")
daniel.password = "password"
mary = Occupant.find_or_create_by(name: "Mary")
mary.password = "password"
admin = Occupant.create(name: "admin", password: "password", password_confirmation: "password", admin: true)



diapers = Good.find_or_create_by(name: "Diapers")
rags = Good.find_or_create_by(name: "Rags")
opener = Good.find_or_create_by(name: "Bottle Opener")
formula = Good.find_or_create_by(name: "Formula", )
bread = Good.find_or_create_by(name: "Bread", description: "soy based for senitive stomach")
peach_tree = Good.find_or_create_by(name: "Peach Tree")
pants = Good.find_or_create_by(name: "Pants", description: "32X30 black dress pants")




groceries = Tag.find_or_create_by(name: "Groceries")
cleaning = Tag.find_or_create_by(name: "Cleaning")
hardware = Tag.find_or_create_by(name: "Hardware")
plants = Tag.find_or_create_by(name: "Plants")
baby = Tag.find_or_create_by(name: "Baby")
clothing = Tag.find_or_create_by(name: "Clothing")

walmart = Shop.find_or_create_by(name: "Wal-mart")
home_depot = Shop.find_or_create_by(name: "Home Depot")
martins = Shop.find_or_create_by(name: "Martins")


house.occupants << [daniel, mary, admin]

daniel.goods << [diapers, formula, peach_tree, pants]
mary.goods << [bread, rags, opener]

diapers.tags << [groceries,baby]
rags.tags << [groceries,cleaning,hardware]
opener.tags << [groceries]
formula.tags << [groceries,baby]
bread.tags << [groceries]
peach_tree.tags << [plants,hardware]
pants.tags << [clothing]

walmart.tags << [groceries,clothing,baby]
home_depot.tags << [hardware,plants]
martins.tags << [groceries,baby]


Good.all.each do |g|
  if g.description == ""
    g.description = Faker::Lorem.paragraph(rand(2..6))
  end
  g.save
end
