RSpec.feature "Attack button: #22", :type => :feature do

  let(:player1) { double:Player, name: "test user 1", hp: Player::MAX_HP, sustain_damage: nil }
  let(:player2) { double:Player, name: "test user 2", hp: Player::MAX_HP, sustain_damage: nil }

  before (:each) do
    sign_in_and_play(player1, player2)
    visit "/play"
  end

  scenario "Game displays an attack button" do
      expect(page).to have_button("Attack")
  end

  scenario "attacking displays confirmation page with reduced hp" do
    click_button("Attack")
    expect(page).to have_text("#{player1.name} (#{player1.hp}) attacked #{player2.name} (#{player2.hp - Player::DAMAGE})")
  end


end
