RSpec.feature "Viewing hit points: #20", :type => :feature do

  let(:user2_hp) { "23"}

  before (:each) do
    visit "/play"
  end

  scenario "Game displays user 2 hit points as text" do
    within("//div[@class='user_2_hp']") do
      expect(page).to have_content("Hit points: #{Battle::MAX_HP}")
    end
  end

  scenario "Game displays user 2 hit points as progress bar" do
    within("//div[@class='user_2_hp']") do
      expect(page.has_xpath?("//progress[@max='#{Battle::MAX_HP}'][@value='#{Battle::MAX_HP}']"))
    end
  end

end
