require 'rails_helper'

describe "Profiles" do
  subject { page }

  describe "sign up page" do
    before do
      visit root_path
      click_link("signup")
    end
    it { should have_content "Sign up" }

    describe "sign up process" do
      before do
        fill_in "Email", with: "testuser@test.com"
        fill_in "user_password", with: "testpassword"
        fill_in "user_password_confirmation", with: "testpassword"
        click_button "Sign up"
      end

      it { expect(current_path).to eql(profiles_new_path) }
      it { should have_field('Nick') }
      it { should have_field('First name') }
      it { should have_field('Last name')}
      it { should have_field('Country')}

      describe "Fill profile" do
        before do
          visit profiles_new_path
          fill_in "profile_nickname", with: "Testozilla"
          fill_in "profile_firstname", with: "Mark"
          fill_in "profile_lastname", with: "Jakobson"
          find_by_id('profile_country').find("option[value='US']").click
          check "profile_use_gravatar"
          click_button "SaveBtn"
        end
        it { should have_content('Hello, Testozilla!') }
        #must have nickname menu item
        it { should have_link("Testozilla", class: 'dropdown-toggle') }
        #it { should have_select("drop_down_id", options: [item1.name, item2.name]) }
      end
    end


  end
end
