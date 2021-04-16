feature 'Enables attacks' do
  scenario 'it returns a confirmation of attack message' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content('Kerri attacks Jason')
  end

  scenario 'reduces Player 2 HP by 10' do
    sign_in_and_play
    allow_any_instance_of(Game).to receive(:rand).and_return(10)
    click_link('Attack')
    click_button('OK')
    expect(page).not_to have_content 'Jason has 60HP'
    expect(page).to have_content 'Jason has 50HP'
  end 

  scenario 'reduces player 2 points randomly' do
    sign_in_and_play
    allow_any_instance_of(Game).to receive(:rand).and_return(5)
    click_link('Attack')
    click_button('OK')
    expect(page).to have_content 'Jason has 55HP'
  end
end