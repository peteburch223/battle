RSpec.feature "You lose: #29", :type => :feature do

  let(:player1) { double:Player, name: "test user 1", hp: Player::MAX_HP, sustain_damage: nil }
  let(:player2) { double:Player, name: "test user 2", hp: Player::MAX_HP, sustain_damage: nil }
  let(:loser) { Player.new(name: "loser", hp: Game::DAMAGE, damage:Game::DAMAGE)}


  before (:each) do
    sign_in_and_play(player1.name, loser.name)
    visit "/play"
    click_button("Attack")
  end

  # scenario "lose page" do
  #   expect(page).to have_text("You lose: #{loser.name}")
  # end
  #
  # scenario "start new game" do
  #   expect(page).to have_button("Start new game")
  # end

end
