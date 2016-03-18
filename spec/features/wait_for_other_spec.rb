RSpec.feature "Single Login Entry", :type => :feature do

  let(:player1) { double:Player, name: "test user 1"}
  let(:player2) { double:Player, name: "test user 2"}

  scenario "one user still waiting for the other" do
    Game.reset
    sign_in_one_player(player1.name)
    click_button("Check")
    expect(page).to have_content("#{player1.name} is waiting for other players")
  end

end
