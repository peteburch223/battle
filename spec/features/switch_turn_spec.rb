RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

RSpec.feature "Switching turns - #27", :type => :feature do

  let(:player1) { "test user 1" }
  let(:player2) { "test user 2" }

  before (:each) do
    Game.reset
    two_player_sign_in(player1, player2)
    visit "/play"
  end

  scenario "by default it's player 1's turn" do
    expect(page).to have_content("#{player1}'s turn!")
  end

  scenario "attacking switches player",:broken => true do
    click_button("Attack")
    click_button("Back to Battle!")
    expect(page).to have_content("#{player2}'s turn!")
    expect(page).not_to have_content("#{player1}'s turn!")
  end

  scenario "attacking repeatedly switches player repeatedly",:broken => true do
    click_button("Attack")
    click_button("Back to Battle!")
    click_button("Attack")
    click_button("Back to Battle!")
    expect(page).to have_content("#{player1}'s turn!")
    expect(page).not_to have_content("#{player2}'s turn!")

  end
end
