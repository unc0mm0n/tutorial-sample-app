require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "Signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign Up')) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
      end

      describe "after invalid submission" do
        before { click_button submit }

        it { should have_title('Sign Up') }
        it { should have_content('error') }
        it { should have_content("can't be blank") }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button "Create my account" }.to change(User, :count).by(1)
      end

      describe "after valid submission" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

end
