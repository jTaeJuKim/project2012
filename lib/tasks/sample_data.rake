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
    24.times do |n|
      name  = Faker::Name.name
      surname = "Schmidt"
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
  end

  desc "Fill database with song data"
  task populate: :environment do
    song = Song.create!(title: "God is able",
                        artist: "Hillsong Live",
                        lyrics: 
"       B
God is able
        F#
He will never fail
Abm E
He is almighty God
             B
Greater than all we need
             F#
Greater than all we have
Abm E F#
He has done great things

Chorus:
       B
Lifted up
             F#
Defeated the grave
          Abm
Raised to life
           E
Our God is able
       B/D#
In His name
       F#
We overcome
        Abm
For the Lord
    F# E
Our God is able

Verse 2:
God is with us
God is on our side
He will make a way
Far above all we know
Far above all we hope
He has done great things

Bridge:
       B
God is with us
        F#
He will go before
        Abm
He will never leave us
        E
He will never leave us

       B/D#
God is for us
       F#
He has open arms
        Abm F#
He will never fail us
               E
He will never fail us")
  end
end