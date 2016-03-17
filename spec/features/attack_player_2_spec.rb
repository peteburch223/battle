RSpec.feature "Attack button: #22", :type => :feature do

  let(:player1) do
    double:Player, name: "test user 1", hp: Game::MAX_HP, sustain_damage: nil
  end
  let(:player2) do
    double:Player, name: "test user 2", hp: Game::MAX_HP, sustain_damage: nil
  end

  before (:each) do
    sign_in_and_play(player1.name, player2.name)
    visit "/play"
  end

  scenario "Game displays an attack button" do
      expect(page).to have_button("Attack")
  end

  scenario "attack confirmation - player 1" do
    click_button("Attack")
    expect(page).to have_text("#{ player1.name } attacked #{ player2.name }")
  end
  scenario "attack confirmation - player 2" do
    click_button("Attack")
    click_button("Back to Battle!")
    click_button("Attack")
    expect(page).to have_text("#{ player2.name } attacked #{ player1.name }")
  end


end
