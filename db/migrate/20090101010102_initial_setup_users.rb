class InitialSetupUsers < ActiveRecord::Migration
  def self.up
    # Create admin for the whole application, ie site admin
    user = User.create do |u|
      u.login = 'admin'
      u.password = u.password_confirmation = 'password'
      u.email = 'admin@example.com'
      u.active = true
      u.has_role 'site_admin'
    end

    # Create admin for the class User
    user = User.create do |u|
      u.login = 'warrenli'
      u.password = u.password_confirmation = 'password'
      u.email = 'warrenli@example.com'
      u.active = true
      u.has_role 'admin', User
    end

    # Create user modulator
    user = User.create do |u|
      u.login = 'support'
      u.password = u.password_confirmation = 'password'
      u.email = 'support@example.com'
      u.active = true
    end

    # Create a general user
    user = User.create do |u|
      u.login = 'vistabean'
      u.password = u.password_confirmation = 'password'
      u.email = 'vistabean@example.com'
      u.active = true
      u.accepts_role 'modulator', User.find_by_login('support')
    end
  end

  def self.down
  end
end

