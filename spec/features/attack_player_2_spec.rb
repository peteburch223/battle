RSpec.feature "Attack button: #22", :type => :feature do

  let(:user1) { "test user 1"}
  let(:user2) { "test user 2"}
  let(:user2_hp) { "23"}

  before (:each) do
    sign_in_and_play(user1, user2)
    visit "/play"
  end

  scenario "Game displays an attack button" do
      expect(page).to have_button("Attack")
  end

  scenario "Game has pop-up for attack" do
    click_button("Attack")
    # visit "/attack"
    expect(page).to have_text("#{user1} attacked #{user2}")
  end
end
