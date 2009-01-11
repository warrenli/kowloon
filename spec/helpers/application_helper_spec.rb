require File.dirname(__FILE__) + '/../spec_helper'
include ApplicationHelper


describe ApplicationHelper do

  describe "title" do
    it "should set @content_for_title"  do
      title("Welcome").should be_true
      @content_for_title.should eql("Welcome")
      show_title?.should be_true
    end
  end

  describe "show_title?" do
    it "should return true" do
      title("Welcome").should be_true
      @content_for_title.should eql("Welcome")
      show_title?.should be_true
    end
  end

  describe "flash_messages" do
    it "should return notice" do
      flash[:notice] = "Hello World"
      flash_messages =~ /Hello World/         # <div id="flash-notice">Hello World</div>
      flash_messages =~ /div id="flash-notice"/
    end
  end

  describe "locale_link" do
    it "to be tested" do
      I18n.locale         = 'zh-HK'
      locale_link("zh-HK", "中文").should eql("中文 (zh-HK)")
      I18n.locale         = 'en-US'
      locale_link("en-US", "English").should eql("English (en-US)")
    end
  end
end

