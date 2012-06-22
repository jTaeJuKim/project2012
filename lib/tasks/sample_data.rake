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
end