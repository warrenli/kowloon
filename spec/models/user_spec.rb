require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  fixtures :users

  describe 'being created with valid attribures' do
    before(:each) do
      @valid_attributes = {
        :login => 'warrenli',
        :email => 'warrenli@example.com'
      }
      @new_user = User.create!(@valid_attributes)
    end

    it "should not be active" do
      @new_user.active.should be_false
      @new_user.active?.should be_false
      @new_user.password_required?.should be_false
    end

    it "should has no credentials" do
      @new_user.has_no_credentials?.should be_true
    end
  end

  describe 'being signed up with valid attribures' do
    before(:each) do
      @valid_attributes = { :user => { :login => 'warrenli', :email => 'warrenli@example.com' } }
      @new_user = User.new
      @new_user.signup!(@valid_attributes)
      @valid_password = { :user => { :password => 'password', :password_confirmation => 'password'} }
    end

    it "should not be active" do
      @new_user.active.should be_false
      @new_user.active?.should be_false
      @new_user.password_required?.should be_false
    end

    it "should has no credentials" do
      @new_user.has_no_credentials?.should be_true
    end

    it "should deliver_activation_instructions!" do
      old_perishable_token = @new_user.perishable_token
      @new_user.deliver_activation_instructions!
      @new_user.perishable_token.should_not eql(old_perishable_token)
    end

    it "should be activate! with new password" do
      @new_user.activate!(@valid_password)
      @new_user.active.should be_true
      @new_user.active?.should be_true
      @new_user.password_required?.should be_true
    end

    it "should deliver_activation_confirmation!" do
      old_perishable_token = @new_user.perishable_token
      @new_user.deliver_activation_confirmation!
      @new_user.perishable_token.should_not eql(old_perishable_token)
    end

    it "should deliver_password_reset_instructions!" do
      old_perishable_token = @new_user.perishable_token
      @new_user.deliver_password_reset_instructions!
      @new_user.perishable_token.should_not eql(old_perishable_token)
    end
  end

end

