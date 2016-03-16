RSpec.feature "Attack button: #22", :type => :feature do

  let(:user1) { "test user 1"}
  let(:user2) { "test user 2"}
  let(:user1_hp) { Player::MAX_HP}
  let(:user2_hp) { Player::MAX_HP}

  before (:each) do
    sign_in_and_play(user1, user2)
    visit "/play"
  end

  scenario "Game displays an attack button" do
      expect(page).to have_button("Attack")
  end

  scenario "attacking displays confirmation page with reduced hp" do
    click_button("Attack")
    expect(page).to have_text("#{user1} (#{user1_hp}) attacked #{user2} (#{user2_hp - Player::DAMAGE})")
  end


end
