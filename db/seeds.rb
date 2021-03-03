# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

styles = ["Rock", "Pop", "Folk", "Country", "Singer/Songwriter", "Hip-Hop", "RnB", "Soul", "Jazz", "Progressive", "Electronic", "Metal", "Punk"]
features = ["Daytime", "Late Night", "Acoustic", "Heavy", "Festival", "Small Venue"]
musictypes = ["Originals", "Covers", "Mixed Original/Cover Set"]

if Style.count == 0
  styles.each do |style|
    Style.create(name: style)
    puts "Created #{style} style"
  end
end

if Feature.count == 0
  features.each do |feature|
    Feature.create(name: feature)
    puts "Created #{feature} feature"
  end
end

if Musictype.count == 0
  musictypes.each do |musictype|
    Musictype.create(name: musictype)
    puts "Created #{musictype} musictype"
  end
end