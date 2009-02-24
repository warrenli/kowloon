class CreateUserEmails < ActiveRecord::Migration
  def self.up
    create_table :user_emails do |t|
      t.integer     :user_id,                       :null => false
      t.string      :new_email,     :limit => 100,  :null => false
      t.string      :old_email,     :limit => 100,  :null => false
      t.string      :request_code,                  :null => false
      t.datetime    :request_expiration_date,       :null => false
      t.datetime    :confirmed_at,                  :null => true
      t.string      :status,                        :null => false

      t.timestamps
    end
    add_index(:user_emails, :user_id)
    add_index(:user_emails, :request_code)
    add_index(:user_emails, :request_expiration_date)
  end

  def self.down
    drop_table :user_emails
  end
end
