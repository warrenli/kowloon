require File.dirname(__FILE__) + '/../spec_helper'

describe ActivationsController do
  describe "responding to GET new" do
    describe "with valid activation_code" do  
      it "should find inactive user" do
        user = User.make(:active => false, :password => nil, :password_confirmation => nil)
        get :new, :activation_code => user.perishable_token
        response.should be_success
        response.should render_template('new')
        assigns(:user).login.should eql(user.login)
        assigns(:user).active.should be_false
      end
    end

    describe "with invalid activation_code" do
      it "should redirect to root_url" do
        get :new, :activation_code => "xxx"
        response.should be_redirect
        response.should redirect_to(root_url)
      end
    end

    describe "with active user" do
      it "should redirect to root_url" do
        user = User.make
        user.active?.should be_true
        get :new, :activation_code => user.perishable_token
        response.should be_redirect
      end
    end
  end

  describe "responding to GET create" do
    describe "with valid registration data" do 
      it "should redirect to account_url" do
        user = User.make(:active => false, :password => nil, :password_confirmation => nil)
        user.active?.should be_false
        post :create, :id => user.id, 
             :user => { :password => 'password', :password_confirmation => 'password'}
        assigns(:user).login.should eql(user.login)
        assigns(:user).active.should be_true
        response.flash[:notice].should_not be_nil
        response.should redirect_to(account_url)
      end
    end

    describe "with invalid registration data" do 
      it "should re-render 'new' template" do
        user = User.make(:active => false, :password => nil, :password_confirmation => nil)
        user.active?.should be_false
        post :create, :id => user.id, 
             :user => { :password => 'pass', :password_confirmation => 'word'}
        response.should be_success
        response.should render_template('new')
      end
    end

    describe "user already activated" do 
      it "should redirect to root_url" do
        user = User.make
        user.active?.should be_true
        post :create, :id => user.id, 
             :user => { :password => 'pass', :password_confirmation => 'word'}
        response.should redirect_to(root_url)
      end
    end
  end
end
