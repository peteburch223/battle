RSpec.feature "Viewing hit points: #20", :type => :feature do

  let(:player1) { double:Player, name: "test user 1", hp: Game::MAX_HP }
  let(:player2) { double:Player, name: "test user 2", hp: Game::MAX_HP }

  before (:each) do
    Game.reset
    two_player_sign_in(player1.name, player2.name)
  end
  scenario "Game displays user 2 hit points as text" do
    in_browser(:one) do
      within("//div[@class='player2_hp']") do
        expect(page).to have_content("#{player2.name} hitpoints: #{Game::MAX_HP}")
      end
    end
  end

  scenario "Game displays user 2 hit points as progress bar" do
    in_browser(:one) do
      within("//div[@class='player2_hp']") do
        expect(page.has_xpath?("//progress[@max='#{Game::MAX_HP}'][@value='#{Game::MAX_HP}']"))
      end
    end
  end

  scenario "Game displays user 1 hit points as text" do
    in_browser(:one) do
      within("//div[@class='player1_hp']") do
        expect(page).to have_content("#{player1.name} hitpoints: #{Game::MAX_HP}")
      end
    end
  end

  scenario "Game displays user 1 hit points as progress bar" do
    in_browser(:one) do
      within("//div[@class='player1_hp']") do
        expect(page.has_xpath?("//progress[@max='#{Game::MAX_HP}'][@value='#{Game::MAX_HP}']"))
      end
    end
  end


end
