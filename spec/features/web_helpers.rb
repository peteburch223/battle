def sign_in_and_play(player_1, player_2)
  visit "/"
  fill_in "player_1", :with => player_1
  fill_in "player_2", :with => player_2
  click_button "Submit"
end

def sign_in_one_player(player_name)
  visit "/"
  fill_in "player_1", :with => player_name
  click_button "Submit"
end

def in_browser(name)
  old_session = Capybara.session_name

  Capybara.session_name = name
  yield

  Capybara.session_name = old_session
end

def two_player_sign_in(player1_name, player2_name)
  in_browser(:one) do
    sign_in_one_player(player1_name)
  end
  in_browser(:two) do
    sign_in_one_player(player2_name)
  end
  in_browser(:one) do
    click_button("Check")
  end
end
