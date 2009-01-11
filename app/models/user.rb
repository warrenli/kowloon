class User < ActiveRecord::Base
  acts_as_authentic  :login_field_validates_format_of_options => { :message => I18n.t("authlogic.user.login_invalid") },
    :email_field_validation_options => { :message => I18n.t("authlogic.user.email_invalid") },
    :password_field_validation_options => { :unless => :active? },
    :password_field_validates_length_of_options => { :on => :update, :if => :password_required?, :minimum => 8 }

  attr_accessible :login, :email, :password, :password_confirmation

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def deliver_activation_instructions!
    unless active?
      reset_perishable_token!
      Notifier.deliver_activation_instructions(self)
    end
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end

  def active?
    active
  end

  def has_no_credentials?
    self.crypted_password.blank?
    # self.crypted_password.blank? && self.openid_identifier.blank?
  end

  def signup!(params)
    self.login = params[:user][:login]
    self.email = params[:user][:email]
    save_without_session_maintenance
  end

  def activate!(params)
    self.active = true
    self.password = params[:user][:password]
    self.password_confirmation = params[:user][:password_confirmation]
    save
  end

#  alias password_required? active?
   alias_method :password_required?, :active?

end
