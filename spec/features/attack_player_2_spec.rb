# RSpec.feature "Attack button: #22", :type => :feature do
#
#   let(:player1) { "test user 1"}
#   let(:player2) { "test user 2"}
#   let(:player1_hp) { Player::MAX_HP}
#   let(:player2_hp) { Player::MAX_HP}
#
#   before (:each) do
#     sign_in_and_play(player1, player2)
#     visit "/play"
#   end
#
#   scenario "Game displays an attack button" do
#       expect(page).to have_button("Attack")
#   end
#
#   scenario "attacking displays confirmation page with reduced hp" do
#     click_button("Attack")
#     expect(page).to have_text("#{player1} (#{player1_hp}) attacked #{player2} (#{player2_hp - Player::DAMAGE})")
#   end
#
#
# end
