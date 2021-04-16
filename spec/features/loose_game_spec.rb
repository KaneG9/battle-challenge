feature 'Loosing a game' do
  scenario 'If a player reaches 0HP they loose the game' do
    sign_in_and_play
    allow_any_instance_of(Game).to receive(:rand).and_return(60)
    click_link 'Attack'
    expect(page).to have_content 'Jason has died!'
  end
end