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

    add_index (:users, :login, :unique => true)
    add_index (:users, :email, :unique => true)

    # Create default admin user
    user = User.create do |u|
      u.login = 'admin'
      u.password = u.password_confirmation = 'password'
      u.email = 'admin@example.com'
      u.active = true
    end

  end

  def self.down
    # Drop all tables
    drop_table :sessions
    drop_table :users
  end
end

