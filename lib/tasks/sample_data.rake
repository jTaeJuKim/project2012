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

    25.times do |n|

      first = ["Jo", "Gareth", "Graham", "Barry", "Fran",
      "Justin", "Helen", "Rachael", "Michael", "Graham",
      "Chloe", "Tony", "Leon", "Andy", "Gareth",
      "Lily", "Lal", "Dan", "Rachel", "Cynthia",
      "Buki", "Jane", "Julia", "Mary", "Mumie"]
      last =["Gordon", "Donaldson", "Dargie", "McAllister", "Hutchison",
      "Kim", "Rowe", "West", "Robertson", "Alder",
      "Kerr", "Duncan", "Harris", "West", "Boswell",
       "Fox-Davies", "Dhillon", "Clews", "Clews", "Twum", 
       "Olowo", "Merson", "Duthie", "Arthur", "Shangpilang"]
      name  = first[n] 
      surname = last[n] 
      email = "#{first[n]}.#{last[n]}@tkcc.org"
      password  = "foobar"
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

    tester1 = User.create!(name: "Gareth",
      surname: "Donaldson",
      email: "g.donaldson@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester1.toggle!(:admin)

    tester2 = User.create!(name: "Graham",
      surname: "Dargie",
      email: "g.dargie@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester2.toggle!(:admin)

    tester3 = User.create!(name: "Fran",
      surname: "Hutchison",
      email: "f.hutchison@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester3.toggle!(:admin)

    tester4 = User.create!(name: "Tony",
      surname: "Duncan",
      email: "t.duncan@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester4.toggle!(:admin)

    tester5 = User.create!(name: "Barry",
      surname: "McAllister",
      email: "b.mcallister@test.com",
      phone: "01224111111",
      password: "testing",
      password_confirmation: "testing")
    tester.toggle!(:admin)

  end #end user script


  desc "Fill database with song data"
  task populate: :environment do

    50.times do |n|
      titles= ["Holy is the Lord", "God of Ages", "Son of God", 
        "Saviour King",  "Great and Greatly to be Praised", "Freedom is Here", 
        "God is Able", "Saviour of the World", "Lead me to the Cross", 
        "You Deserve", "How Awesome is the Lord Most High", "Here I am to Worship",
        "Heart of Worship", "Holding Nothing Back", "This is your House", 
        "Who is this Love Amazing", "Adoration", "You Chose the Cross",
        "Go", "Blessed be Your Name", "How Great is Our God", 
        "Amazing Grace (My Chains are Gone)", "The Wonder of Your Love", "Mighty to Save",
        "Everything Comes Alive", "Happy Day", "How Great thou Art",
        "Let God Arise", "Here for You", "Jesus Messiah", 
        "Like Incense", "I will Exalt Thee", "The Time has Come", 
        "Glory to God","Forever", "We are the Free", 
        "The Stand", "Glorify Your Name", "Hosanna (Praise is Rising)",
        "Surrender", "This is our God", "Glory", 
        "Take my Life and Let it be", "Awakening", 
        "God of Generations", "Once Again", "I Stand Amazed in the Presence", 
        "Nothing is Impossible", "Running", "Lift Up Your Eyes" ]
        
      artists= ["Chris Tomlin", "Hillsong", "Starfield", 
        "Hillsong Live", "Fee", "Hillsong",
        "Hillsong", "Ben Cantelon", "Hillsong",
        "Hillsong United", "Chris Tomlin", "Tim Hughes",
        "Matt Redman", "Jesus Culture", "Simon Robertson",
        "Chris McClarney", "Brenton Brown", "Martyn Layzell",
        "Hillsong Live", "Matt Redman", "Chris Tomlin",
        "Chris Tomlin", "Hillsong", "Hillsong United",
        "Hillsong", "Tim Hughes", "Stuart K Hine",
        "Chris Tomlin", "Chris Tomlin", "Chris Tomlin",
        "Hillsong", "Hillsong United", "Hillsong United",
        "Fee", "Chris Tomlin", "Matt Redman",
        "Hillsong United", "Simon Robertson", "Brenton Brown",
        "Kim Walker", "Hillsong Live", "Hillsong",
        "Michael Neale", "Chris Tomlin",
        "Simon Robertson", "Matt Redman", "Chris Tomlin",
        "Planetshakers", "Hillsong Live", "Planetshakers"]

      keys=["G", "G", "G",
       "E", "E", "G", 
       'E', "Bb", "A",
       'C#', "G", "E",
       "D", "E", "E",
       "E", "G", "G",
       'C#', 'G', 'G',
       'D', 'G', 'A',
       'A', 'A', 'G',
       'E', 'G', 'F',
       'E', 'E', 'A',
       'G', 'E', 'B',
       'A', 'A', 'G',
       'C', 'E', 'E',
       'E', 'Bb', 'G',
       'A', 'D',
       'A', 'A', 'Bb']




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
      "Vox 1", "Vox 2", "Vox 3", "AM Sound", "PM Sound"]

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
       20, 20, 21, 22, 23, 
       24, 25, 26, 27]
      roles = [1, 2, 1, 3, 5,
       1, 2, 1, 4, 1,
       8, 3, 5, 4, 4,
       5, 6, 6, 7, 7,
       6, 12, 13, 2, 5,
       5, 12, 13, 12, 13,
       12, 13, 11, 9, 9, 
       10, 10, 11, 9]

       39.times do |r|
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

  desc "Fill the database with setlists"
  task populate: :environment do
    sampleDate = Date.today
    21.times do |n|
      type = true
      
      if(n%2 == 0)
        type = false
      end
      
      Setlist.create(date: sampleDate + (n*7),
        morning: type) 
    end  
  end#end setlist data

  desc "Fill the database with allocations"
  task populate: :environment do

    #set 1
    Allocation.create(setlist_id: 1, song_id: 1, position: 1)
    Allocation.create(setlist_id: 1, song_id: 2, position: 2)
    Allocation.create(setlist_id: 1, song_id:3, position: 3)
    Allocation.create(setlist_id: 1, song_id:4, position: 4)
    #set 2
    Allocation.create(setlist_id: 2, song_id:5, position:1)
    Allocation.create(setlist_id: 2, song_id:6, position:2)
    Allocation.create(setlist_id: 2, song_id:7, position:3)  
    Allocation.create(setlist_id: 2,song_id: 8, position:4)
    Allocation.create(setlist_id: 2, song_id:9, position:5)

    #set 3
    Allocation.create(setlist_id: 3, song_id:10, position:1)
    Allocation.create(setlist_id: 3, song_id:11, position:2)
    Allocation.create(setlist_id: 3,song_id: 12, position:3)
    Allocation.create(setlist_id: 3, song_id:13, position:4)

    #4
    Allocation.create(setlist_id: 4,song_id:14, position:1)
    Allocation.create(setlist_id: 4,song_id: 15, position:2)
    Allocation.create(setlist_id: 4,song_id: 16, position:3)
    Allocation.create(setlist_id: 4,song_id: 17, position:4)
    Allocation.create(setlist_id: 4,song_id: 18, position:5)

    #5
    Allocation.create(setlist_id: 5,song_id: 19, position:1)
    Allocation.create(setlist_id: 5,song_id: 20, position:2)
    Allocation.create(setlist_id: 5,song_id: 21, position:3)
    Allocation.create(setlist_id: 5, song_id:22, position:4)

    #6
    Allocation.create(setlist_id: 6, song_id:16, position:1)
    Allocation.create(setlist_id: 6,song_id: 5, position:2)
    Allocation.create(setlist_id: 6,song_id: 23, position:3)
    Allocation.create(setlist_id: 6, song_id:24, position:4)
    #7
    Allocation.create(setlist_id: 7,song_id: 25, position:1)
    Allocation.create(setlist_id: 7,song_id: 26, position:2)
    Allocation.create(setlist_id: 7, song_id:21, position:3)
    Allocation.create(setlist_id: 7, song_id:27, position:4)
    Allocation.create(setlist_id: 7,song_id: 7, position:5)

    #8
    Allocation.create(setlist_id: 8, song_id:28, position:1)
    Allocation.create(setlist_id: 8, song_id:11, position:2)
    Allocation.create(setlist_id: 8, song_id:29, position:3)
    Allocation.create(setlist_id: 8,song_id: 30, position:4)

    #9p
    Allocation.create(setlist_id: 9, song_id:25, position:1)
    Allocation.create(setlist_id: 9, song_id:16, position:2)
    Allocation.create(setlist_id: 9, song_id:31, position:3)
    Allocation.create(setlist_id: 9,song_id: 32, position:4)

    #10
    Allocation.create(setlist_id: 10, song_id:33, position:1)
    Allocation.create(setlist_id: 10, song_id:2, position:2)
    Allocation.create(setlist_id: 10, song_id:8, position:3)
    Allocation.create(setlist_id: 10, song_id:9, position:4)
    Allocation.create(setlist_id: 10, song_id:24, position:5)

    #11
    Allocation.create(setlist_id: 11, song_id:5, position:1)
    Allocation.create(setlist_id: 11, song_id:34, position:2)
    Allocation.create(setlist_id: 11, song_id:29, position:3)
    Allocation.create(setlist_id: 11, song_id:7,position:4)

    #12
    Allocation.create(setlist_id: 12, song_id:35, position:1)
    Allocation.create(setlist_id: 12, song_id:36, position:2)
    Allocation.create(setlist_id: 12, song_id:29, position:3)
    Allocation.create(setlist_id: 12, song_id:3, position:4)

    #13
    Allocation.create(setlist_id: 13, song_id:28, position:1)
    Allocation.create(setlist_id: 13, song_id:37, position:2)
    Allocation.create(setlist_id: 13, song_id:27, position:3)

    #14
    Allocation.create(setlist_id: 14,song_id: 38, position:1)
    Allocation.create(setlist_id: 14, song_id:2, position:2)
    Allocation.create(setlist_id:14,song_id: 34, position:3)
    Allocation.create(setlist_id: 14,song_id: 5, position:4)
    Allocation.create(setlist_id: 14,song_id: 7, position:5)

    #15song_id:
    Allocation.create(setlist_id: 15, song_id:39, position:1)
    Allocation.create(setlist_id: 15, song_id:36, position:2)
    Allocation.create(setlist_id: 15, song_id:4, position:3)

    #16song_id:
    Allocation.create(setlist_id: 16, song_id:33, position:1)
    Allocation.create(setlist_id: 16, song_id:14, position:2)
    Allocation.create(setlist_id: 16, song_id:4, position:3)
    Allocation.create(setlist_id: 16, song_id:40, position:4)
    Allocation.create(setlist_id: 16, song_id:41, position:5)

    #17

    Allocation.create(setlist_id: 17,song_id: 42, position:1)
    Allocation.create(setlist_id: 17,song_id: 43, position:2)
    Allocation.create(setlist_id: 17,song_id: 44, position:3)

    #18
    Allocation.create(setlist_id: 18,song_id: 33, position:1)
    Allocation.create(setlist_id: 18, song_id:27, position:2)
    Allocation.create(setlist_id: 18, song_id:29, position:3)
    Allocation.create(setlist_id: 18, song_id:41, position:4)
    Allocation.create(setlist_id: 18,song_id: 17, position:5)

    #19
    Allocation.create(setlist_id: 19, song_id:35, position:1)
    Allocation.create(setlist_id: 19, song_id:23, position:2)
    Allocation.create(setlist_id: 19,song_id: 45, position:3)
    Allocation.create(setlist_id: 19, song_id:46, position:4)
    Allocation.create(setlist_id: 19,song_id: 47, position:5)

    #20
    Allocation.create(setlist_id: 20, song_id:39, position:1)
    Allocation.create(setlist_id: 20,song_id: 48, position:2)
    Allocation.create(setlist_id: 20,song_id: 49, position:3)
    Allocation.create(setlist_id: 20, song_id:29, position:4)
    Allocation.create(setlist_id: 20, song_id:50, position:5)

    #21
    Allocation.create(setlist_id: 21,song_id: 15, position:1)
    Allocation.create(setlist_id: 21,song_id: 10, position:2)
    Allocation.create(setlist_id: 21,song_id: 3, position:3)


  end #end allocations

  desc "Fill database with categories"
  task populate: :environment do
    # testCat = ["fast", "slow", "medium", "grace", 
    #   "salvation", "God's power", "communion", "contemporary", 
    #   "traditional", "love", "thanksgiving", "hope"]

    testCat = ["Tag A", "Tag B" ,"Tag C", "Tag D", "Tag E", "Tag F", 
      "Tag G", "Tag H", "Tag I", "Tag J", "Tag K", "Tag L", 
      "Tag M", "Tag N", "Tag O" , "Tag P", "Tag Q", "Tag R"]

    18.times do |c|
      Category.create(tag: testCat[c])
    end 
  end # end categories

  desc "Fill database with categorizations"
  task populate: :environment do

  # cat_id = [3, 1, 2, 2, 1, 3, 3, 3, 2, 1,
  #   1, 2, 2, 1, 1, 3, 2, 3, 1, 3,
  #   2, 2, 3, 3, 1, 1, 3, 1, 2, 2,
  #   2, 2, 1, 1, 1, 1, 2, 1, 3, 2,
  #   2, 3, 3, 2, 1, 3, 2, 1, 1, 2]
  

  cat_id = [1, 2, 3, 18, 5, 6, 7, 8, 17, 10,
            17, 12, 3, 4, 14, 6, 14, 8, 9, 13,
            16, 16, 11, 11, 12, 13, 7, 18, 13, 10,
            1, 3, 3, 15, 14, 1, 7, 17, 9, 12,
            14, 2, 5, 15, 5, 10, 18, 8, 9, 11]

    50.times do |c|
      Categorization.create(category_id: cat_id[c], song_id: c + 1)
    end
  end #end categorizations


end

