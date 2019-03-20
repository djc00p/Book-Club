require 'rails_helper'

RSpec.describe 'Check for Navbar' do
  it "shows links" do
    visit root_path
    # save_and_open_page
    within ".navbar" do
      expect(page).to have_link("Welcome page")
      expect(page).to have_link("Books")
    end
  end
end
