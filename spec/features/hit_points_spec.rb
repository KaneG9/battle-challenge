feature 'Enter player names' do
  scenario 'it allows to see player 2 hit point' do
    sign_in_and_play
    expect(page).to have_content 'Jason has 60HP'
  end
end 