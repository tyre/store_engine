require 'spec_helper'

describe "Application Requests" do
  context "homepage" do
    
    before(:each) do
      visit "/"
    end

    context "layout" do
      it "shows the cart in the nav bar" do
        page.should have_content("Cart")
      end

      it "shows cart as empty" do
        page.should have_content("Nothing in your cart!")
      end

      it "has a link to sign-up" do
        page.should have_link("Sign up", :href => "/signup")
      end

      it "has a link to login (no one should be logged in)" do
        page.should have_link("Login", :href => "/login")
      end
    end
  end
end

