RSpec.feature "User Entry", :type => :feature do

  let(:player1) { double:Player, name: "test user 1"}
  let(:player2) { double:Player, name: "test user 2"}

  scenario "Users enter names and page displays the names" do
    sign_in_one_player(player1.name)
    expect(page).to have_content("#{player1.name} is waiting for other players")
    expect(page).to have_button("Check")
  end

  scenario "one user still waiting for the other" do
    sign_in_one_player(player1.name)
    click_button("Check")
    expect(page).to have_content("#{player1.name} is waiting for other players")
  end

  scenario "other player has logged in and game starts" do


  end

end
