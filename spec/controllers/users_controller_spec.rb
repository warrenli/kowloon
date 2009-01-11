require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do

  describe "responding to GET new" do
    it "should render 'new' template and expose a new user as @user" do
      get :new
      response.should be_success
      response.should render_template('new')
      assigns[:user].should_not be_nil
    end
  end

  describe "responding to POST create" do
    describe "with valid params (login and email)" do
      it "should create a new user and redirect to root_url" do
        assert_difference('User.count') do
          post :create, :user => { "login" => 'warren', "email" => 'warren@example.com' }
        end
        assigns(:user).login.should eql("warren")
        assigns(:user).email.should eql("warren@example.com")
        assigns(:user).active.should be_false
        response.flash[:notice].should_not be_nil
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "should re-render 'new' template" do
        assert_no_difference 'User.count' do
          post :create, :user => { "login" => '', "email" => '' }
        end
        response.should be_success
        response.should render_template('new')
      end
    end
  end

  describe "responding to GET show" do
    it "should render 'show' template" do
      user = User.make
      set_session_for(user)
      get :show
      assigns(:user).login.should eql(user.login)
      response.should be_success
      response.should render_template('show')
    end
  end

  describe "responding to GET edit" do
    it "should render 'edit' template'" do
      user = User.make
      set_session_for(user)
      get :edit, :id => user.id
      assigns(:user).login.should eql(user.login)
      response.should be_success
      response.should render_template('edit')
    end
  end

  describe "responding to PUT update" do
    describe "with valid params (login and email)" do
      it "should redirect to 'show' template" do
        user = User.make
        set_session_for(user)
        put :update, :id => user.id, 
            :user => { :password => 'password', :password_confirmation => 'password' }
        response.should redirect_to(account_url)
      end
    end
    describe "with invalid params" do
      it "should re-render 'edit' template" do
        user = User.make
        set_session_for(user)
        put :update, :id => user.id, :user => { :email => '' }
        response.should be_success
        response.should render_template('edit')
      end
    end
  end

end

