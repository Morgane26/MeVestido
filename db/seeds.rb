# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "begin seeding"

puts "clean database"

#  il faut tout detruire avant de creer du neuf

User.destroy_all  # DONE
Article.destroy_all  # DONE
Proposal.destroy_all
Outfit.destroy_all
Color.destroy_all  # DONE
Shoe.destroy_all  # DONE
Coat.destroy_all  # DONE
Bottom.destroy_all  # DONE
Dress.destroy_all  # DONE
Top.destroy_all  # DONE




#     Gem devise
#     USERS
puts "create users"
user1 = User.create!(
  email: "chaton@gmail.com",
  password: "password",
  password_confirmation: "password",
  city: "Montpellier",
)

user2 = User.create!(
  email: "toto@gmail.com",
  password: "password",
  password_confirmation: "password",
  city: "Marseille",
)


#     COLORS
puts "create colors"

colors = [
  ["black", "#000000"],
  ["white", "#ffffff"],
  ["silver", "#C0C0C0"],
  ["grey", "#808080"],
  ["red", "#FF0000"],
  ["maroon", "#800000"],
  ["yellow", "#FFFF00"],
  ["olive", "#808000"],
  ["lime", "#00FF00"],
  ["green", "#008000"],
  ["aqua", "#00FFFF"],
  ["teal", "#008080"],
  ["blue", "#0000FF"],
  ["navy", "#000080"],
  ["fushia", "#FF00FF"],
  ["purple", "#800080"],
  ["orange", "#FFAF33"],
  ["dark green", "#006400"],
  ["pink", "#E71EB0"],
  ["egg shell", "#FCFCF8"],
  ["light salmon", "#FFA07A"],
  ["gold", "#FFD700"],
  ["lavander", "#E6E6FA"],
  ["grey blue", "#213856"],
  ["violet", "#9400D3"],
  ["sky blue", "#87CEEB"],
  ["chocolate", "#8B4513"],
  ["beige", "#FDF5E6"],
  ["ivory", "#FFFFF0"],
  ["firebrick", "#B22222"],
]

colors.each do |color|
  Color.create!(name: color[0], hex: color[1])
end

#     SHOES
puts "create shoes"
shoes1 = Shoe.create!(kind: :baskets)
shoes2 = Shoe.create!(kind: :sandals)
shoes3 = Shoe.create!(kind: :heels)
shoes4 = Shoe.create!(kind: :tongs)
shoes5 = Shoe.create!(kind: :loafers)

#     BOTTOMS
puts "create bottom"
bottom1 = Bottom.create!(kind: :jean)
bottom2 = Bottom.create!(kind: :legging)
bottom3 = Bottom.create!(kind: :jogging)
bottom4 = Bottom.create!(kind: :short)
bottom5 = Bottom.create!(kind: :skirt)
bottom6 = Bottom.create!(kind: :chino)

#     COATS
puts "create coats"
coat1 = Coat.create!(kind: :jean)
coat2 = Coat.create!(kind: :perfecto)
coat3 = Coat.create!(kind: :trench)
coat4 = Coat.create!(kind: :long)

#     DRESS
puts "create dresses"
dress1 = Dress.create!(kind: :long)
dress2 = Dress.create!(kind: :midi)
dress3 = Dress.create!(kind: :courte)

#     TOP
puts "create tops"
top1 = Top.create!(kind: :tee_shirt)
top2 = Top.create!(kind: :debardeur)
top3 = Top.create!(kind: :chemise)
top4 = Top.create!(kind: :crop_top)
top5 = Top.create!(kind: :pull)
top6 = Top.create!(kind: :sweat)


#     ARTICLES
puts "create article"
article1 = Article.new(
  season: :summer,
  usage: :chill,
  user: user2,
  color: Color.first,
)
article1.wearable = shoes1
article1.save!



article2 = Article.new(
  season: :winter,
  usage: :work,
  user: user1,
  color: Color.first,
)
article2.wearable = bottom2
article2.save!


article3 = Article.new(
  season: :summer,
  usage: :chill,
  user: user1,
  color: Color.last,
)
article3.wearable = dress1
article3.save!


article4 = Article.new(
  season: :autumn,
  usage: :night,
  user: user2,
  color: Color.first,
)
article4.wearable = coat1
article4.save!

article5 = Article.new(
  season: :summer,
  usage: :chill,
  user: user2,
  color: Color.last,
)
article5.wearable = top4
article5.save!

article6 = Article.new(
  season: :summer,
  usage: :chill,
  user: user2,
  color: Color.first,
)
article6.wearable = bottom2
article6.save!

article7 = Article.new(
  season: :summer,
  usage: :chill,
  user: user2,
  color: Color.first,
)
article7.wearable = shoes4
article7.save!

#       PROPOSAL 1
puts "Mevestido is creating a new proposal"
proposal1 = Proposal.create!(
  meteo: :summer,
  usage: :chill,
)
#   Outfit du proposal 1
Outfit.create!(
  proposal: proposal1,
  article: article3,
)

Outfit.create!(
  proposal: proposal1,
  article: article1,
)

proposal2 = Proposal.create!(
  meteo: :summer,
  usage: :chill,
)

#   Outfit du proposal 2
Outfit.create!(
  proposal: proposal2,
  article: article5,
)

Outfit.create!(
  proposal: proposal2,
  article: article6,
)

Outfit.create!(
  proposal: proposal2,
  article: article7,
)
# #     PROPOSAL 2
# proposal2 = Proposal.create!(
#   meteo: :summer,
#   usage: :work,
# )
# #   Outfit du proposal 2
# outfit2 = Outfit.create!(
#   proposal: proposal2,
#   article: article2,
#   )

# proposal2 = Proposal.new(
#   meteo: :snowy,
#   usage: :work,
#   )
# proposal2.save!

# proposal3 = Proposal.new(
#   meteo: :shinny,
#   usage: :work,
#   )
# proposal3.save!

# proposal4 = Proposal.new(
#   meteo: :windy,
#   usage: :chill,
#   )
# proposal4.save!










#   OUTFITS
# puts "Your new outfit"
# outfit = Outfit.new(
#   proposal: proposal1
#   article: article4
#   )





puts "summary"
puts "#{Color.count} colors created"
puts "#{User.count} users created"
puts "#{Shoe.count} shoes created"
puts "#{Article.count} articles created"
puts "#{Proposal.count} proposals created"











