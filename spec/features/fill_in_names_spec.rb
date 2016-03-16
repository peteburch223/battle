RSpec.feature "User Entry", :type => :feature do

  let(:player1) { double:Player, name: "test user 1"}
  let(:player2) { double:Player, name: "test user 2"}
  scenario "Users enter names and page displays the names" do

    sign_in_and_play(player1.name, player2.name)

    within("//div[@class='heading']") do
      expect(page).to have_content("#{player1.name} vs #{player2.name}")
    end
  end
end
