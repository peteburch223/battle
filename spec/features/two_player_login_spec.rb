RSpec.feature "Two player Login", :type => :feature do

  let(:player1) { double:Player, name: "player 1"}
  let(:player2) { double:Player, name: "player 2"}


  scenario "other player has logged in and game starts" do
    Game.reset
    # Capybara.reset_sessions!
    # require 'pry'; binding.pry
    in_browser(:one) do
      sign_in_one_player(player1.name)
    end
    in_browser(:two) do
      sign_in_one_player(player2.name)
    end
    in_browser(:one) do
      click_button("Check")
      expect(page).to have_content("Players: #{player1.name} #{player2.name}")
    end
    in_browser(:two) do
      click_button("Check")
      expect(page).to have_content("Players: #{player1.name} #{player2.name}")
    end
  end

end
