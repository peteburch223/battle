def sign_in_and_play(user1, user2)
  visit "/"
  fill_in "user_1", :with => user1
  fill_in "user_2", :with => user2
  click_button "Submit"
end
