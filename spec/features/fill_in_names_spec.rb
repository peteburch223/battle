RSpec.feature "User Entry", :type => :feature do

 let(:test_user) { "test user"}
  scenario "User enters name and page displays the name" do
    visit "/"

    fill_in "name", :with => test_user
    click_button "Submit"

    expect(page).to have_text(test_user)
  end
end
