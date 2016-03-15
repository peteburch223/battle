RSpec.feature "User Entry", :type => :feature do

  let(:user1) { "test user 1"}
  let(:user2) { "test user 2"}
  scenario "Users enter names and page displays the names" do

    sign_in_and_play(user1, user2)

    within("//div[@class='heading']") do
      expect(page).to have_content("#{user1} vs #{user2}")
    end
  end
end
