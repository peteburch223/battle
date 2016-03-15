RSpec.feature "Viewing hit points: #20", :type => :feature do

  let(:user1) { "test user 1"}
  let(:user2) { "test user 2"}
  let(:user2_hp) { "23"}

  before (:each) do
    sign_in_and_play(user1, user2)
    visit "/play"
  end

  scenario "Game displays user 2 hit points as text" do
    within("//div[@class='user_2_hp']") do
      expect(page).to have_content("#{user2} hitpoints: #{Battle::MAX_HP}")
    end
  end

  scenario "Game displays user 2 hit points as progress bar" do
    within("//div[@class='user_2_hp']") do
      expect(page.has_xpath?("//progress[@max='#{Battle::MAX_HP}'][@value='#{Battle::MAX_HP}']"))
    end
  end

end
