namespace :db do

  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Tae Ju",
                 surname: "Kim",
                 email: "tjk.abdn@gmail.com",
                 phone: "01224533766",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)

    supervisor = User.create!(name: "Robin",
      surname:"Boswell",
      email: "r.boswell@rgu.ac.uk",
      phone: "01224111111",
      password: "foobar",
      password_confirmation: "foobar")
    supervisor.toggle!(:admin)


    18.times do |n|

      first = ["Jo", "Gareth", "Graham", "Barry", "Fran",
      "Justin", "Helen", "Rachael", "Michael", "Graham",
      "Chloe", "Tony", "Leon", "Andy", "Gareth", "Lily", "Lal", "Dan"]
      last =["Gordon", "Donaldson", "Dargie", "McAllister", "Hutchison",
      "Kim", "Rowe", "West", "Robertson", "Alder",
      "Kerr", "Duncan", "Harris", "West", "Boswell", "Fox-Davies", "Dhillon", "Clews"]
      name  = first[n] #Faker::Name.name replace faker with relevant sample
      surname = last[n] #"Schmidt"
      email = "example-#{n+1}@tkcc.org"
      password  = "password"
      phone= "01330999877"
      User.create!(name: name,
                   surname: surname,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
    end
  end #end user script

  desc "Fill database with song data"
  task populate: :environment do

    11.times do |n|
      titles=["God is Able", "Holding Nothing Back", "Who is this Love Amazing",
        "Holy is the Lord", "You Alone Can Rescue", "Mighty to Save", "You Deserve", "Go", 
        "How Awesome is the Lord Most High", "Great and Greatly to be Praised", "Happy Day"]
      artists=["Hillsong Live", "Jesus Culture", "Chris McClarney", "Chris Tomlin",
        "Matt Redman", "Joel Houston", "Reuben Morgan", "Hillsong United", "Chris Tomlin", "Fee",
        "Tim Hughes"]
      keys=["B", "E", "C", "G", "Bb", "A", 'C#', "E", "E", "E", "A"]

        Song.create!(title: titles[n],
          artist: artists[n],
          lyrics: 
"         G
  God is able
           D 
  He will never fail",
                  key: keys[n]  )
    end
  end #end song script

  desc "Fill database with roles data"
  task populate: :environment do
    roles = ["Leader", "Acoustic", "Electric", "Piano",
     "Bass", "Drums", "Sax", "Violin",
      "Vox1", "Vox2", "Vox3", "AM Sound", "PM Sound"]

      13.times do |n|
        bandRoles = roles[n]
        Role.create!(description: bandRoles)
      end
  end #end role script


end

