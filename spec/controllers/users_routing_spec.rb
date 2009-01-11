require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  describe "route generation" do
=begin
    it "should map #index" do
      route_for(:controller => "users", :action => "index").should == "/users"
    end
    it "should map #new" do
      route_for(:controller => "users", :action => "new").should == "/users/new"
    end
    it "should map #show" do
      route_for(:controller => "users", :action => "show", :id => 1).should == "/users/1"
    end
    it "should map #edit" do
      route_for(:controller => "users", :action => "edit", :id => 1).should == "/users/1/edit"
    end
    it "should map #update" do
      route_for(:controller => "users", :action => "update", :id => 1).should == "/users/1"
    end
    it "should map #destroy" do
      route_for(:controller => "users", :action => "destroy", :id => 1).should == "/users/1"
    end
=end
    it "should map #new_account" do
      route_for(:controller => "users", :action => "new").should == "/account/new"
    end

    it "should map #show_account" do
      route_for(:controller => "users", :action => "show").should == "/account"
    end

    it "should map #edit_account" do
      route_for(:controller => "users", :action => "edit").should == "/account/edit"
    end

    it "should map #update_account" do
      route_for(:controller => "users", :action => "update").should == "/account"
    end

    it "should map #destroy_account" do
      route_for(:controller => "users", :action => "destroy").should == "/account"
    end
  end

  describe "route recognition" do
=begin
    it "should generate params for #index" do
      params_from(:get, "/users").should == {:controller => "users", :action => "index"}
    end
    it "should generate params for #new" do
      params_from(:get, "/users/new").should == {:controller => "users", :action => "new"}
    end
    it "should generate params for #create" do
      params_from(:post, "/users").should == {:controller => "users", :action => "create"}
    end
    it "should generate params for #show" do
      params_from(:get, "/users/1").should == {:controller => "users", :action => "show", :id => "1"}
    end
    it "should generate params for #edit" do
      params_from(:get, "/users/1/edit").should == {:controller => "users", :action => "edit", :id => "1"}
    end
    it "should generate params for #update" do
      params_from(:put, "/users/1").should == {:controller => "users", :action => "update", :id => "1"}
    end
    it "should generate params for #destroy" do
      params_from(:delete, "/users/1").should == {:controller => "users", :action => "destroy", :id => "1"}
    end
=end
    it "should generate params for #new_account" do
      params_from(:get, "/account/new").should == {:controller => "users", :action => "new"}
    end

    it "should generate params for #create_account" do
      params_from(:post, "/account").should == {:controller => "users", :action => "create"}
    end

    it "should generate params for #show_account" do
      params_from(:get, "/account").should == {:controller => "users", :action => "show"}
    end

    it "should generate params for #edit_account" do
      params_from(:get, "/account/edit").should == {:controller => "users", :action => "edit"}
    end

    it "should generate params for #update_account" do
      params_from(:put, "/account").should == {:controller => "users", :action => "update"}
    end

    it "should generate params for #destroy_account" do
      params_from(:delete, "/account").should == {:controller => "users", :action => "destroy"}
    end

  end
end
