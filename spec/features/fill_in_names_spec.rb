RSpec.feature "User Entry", :type => :feature do
  scenario "User enters name" do
    visit "/"

    fill_in "name", :with => "test user"
    click_button "Submit"

    expect(page).to have_text("test user")
  end
end
