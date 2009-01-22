class InitialSetup < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string      :session_id, :null => false
      t.text        :data
      t.timestamps
    end

    add_index :sessions, :session_id

    create_table :users do |t|
      t.string      :login,                 :null => false
      t.string      :email,                 :null => false, :default => ""
      t.boolean     :active,                :null => false, :default => false
      t.integer     :login_count,           :null => false, :default => 0
      t.string      :perishable_token,      :null => false, :default => ""
      t.string      :persistence_token,     :null => false
      t.string      :crypted_password
      t.string      :password_salt
      t.datetime    :last_request_at
      t.datetime    :last_login_at
      t.datetime    :current_login_at
      t.string      :last_login_ip
      t.string      :current_login_ip
      # t.string    :single_access_token,   :null => false # optional

      t.timestamps
    end

    add_index(:users, :login, :unique => true)
    add_index(:users, :email, :unique => true)

    create_table :roles_users, :id => false, :force => true  do |t|
      t.integer :user_id, :role_id
      t.timestamps
    end

    add_index(:roles_users, [:user_id, :role_id])
    add_index(:roles_users, :role_id)

    create_table :roles, :force => true do |t|
      t.string  :name, :authorizable_type, :limit => 40
      t.integer :authorizable_id
      t.timestamps
    end

    add_index(:roles, [:authorizable_type, :authorizable_id])
    add_index(:roles, :name)

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
    # Drop all tables
    drop_table :sessions
    drop_table :users
  end
end

