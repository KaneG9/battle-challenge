feature 'Changes turns after attack' do
  scenario "P1 attacks then its P2's turn" do
    sign_in_and_play
    click_link('Attack')
    click_link('OK')
    click_link('Attack')
    expect(page).to have_content('Jason attacks Kerri')
  end

  scenario "P2 attacks P1 and P1's HP changes" do
    sign_in_and_play
    click_link('Attack')
    click_link('OK')
    click_link('Attack')
    click_link('OK')
    expect(page).to have_content('Kerri has 50HP')
    expect(page).not_to have_content('Kerri has 60HP')
  end

  scenario "attacker in play page changes" do
    sign_in_and_play
    click_link('Attack')
    click_link('OK')
    expect(page).to have_content("Jason's turn")
  end
end