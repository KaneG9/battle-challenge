feature 'Loosing a game' do
  scenario 'If a player reaches 0HP they loose the game' do
    sign_in_and_play
    10.times do 
      click_link 'Attack'
      click_button 'OK'
    end
    click_link 'Attack'
    expect(page).to have_content 'Jason has died!'
  end
end