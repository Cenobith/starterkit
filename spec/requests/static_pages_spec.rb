require 'rails_helper'

describe "Static Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title("Cenobith Starter Kit") }
    it { has_link?("HomeLnk") }
    it { has_link?("/users/sign_in") }
    it { has_link?("/users/sign_up") }
  end
end
