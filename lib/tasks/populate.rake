namespace :db do
  desc "Fill the database with test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    User.populate 500 do |user|
        user.login                  = "#{Faker::Name.first_name}_" + "#{user.id}"
        user.email                  = "#{user.login}@#{Faker::Internet.domain_name}"
        user.active                 = [true, false]
        user.login_count            = 0
        user.perishable_token       = Populator.words(20)
        user.persistence_token      = Populator.words(128)
        user.crypted_password       = Populator.words(128)
        user.password_salt          = Populator.words(128)
    end
  end
end

