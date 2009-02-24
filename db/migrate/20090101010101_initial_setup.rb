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
  end

  def self.down
    # Drop all tables
    drop_table :sessions
    drop_table :users
  end
end

