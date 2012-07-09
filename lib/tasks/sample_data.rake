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
      name  = first[n] 
      surname = last[n] 
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

    tester = User.create!(name: "Jo",
      surname: "Gordon",
      email: "j.gordon@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester.toggle!(:admin)

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

  desc "Fill database with role assignments"
  task populate: :environment do

      users = [3, 3, 4, 4, 4,
       5, 5, 6, 6, 7,
       7, 8, 8, 9, 10,
       10, 11, 12, 13, 14,
       15, 15, 15, 16, 16,
       17, 18, 18, 19, 19,
       20, 20]
      roles = [1, 2, 1, 3, 5,
       1, 2, 1, 4, 1,
       8, 3, 5, 4, 4,
       5, 6, 6, 7, 7,
       6, 12, 13, 2, 5,
       5, 12, 13, 12, 13,
       12, 13]

       32.times do |r|
        u_id = users[r]
        r_id = roles[r]
        Assignment.create!(user_id: u_id, role_id: r_id)
       end
  end #end role assignment

  desc "Fill database with services"
  task populate: :environment do

    sampleDate = Date.today

    12.times do |n|
      Service.create!(date: sampleDate + (n*7),
        leader: "Jo Gordon",
        acoustic: "Jo Gordon",
        electric: "Gareth Donaldson",
        piano: "Rachael West",
        bass: "Justin Kim",
        drums: "Michael Robertson",
        sax: "Tony Duncan",
        violin: "Fran Hutchison",
        singers: "Vox 1",
        soundAM: "Dan Clews",
        soundPM: "Lily Fox-Davies")
    end

  end #end service data


end

