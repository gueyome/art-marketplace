describe "the signup process", type: :feature do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    # on va sur la page de création d'utilisateurs
    visit '/users/new'

    # dans le formulaire des users, on remplit les données qu'il faut
    within("#user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end

    # clik clik
    click_button 'Sign in'

    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'Success'
  end
end