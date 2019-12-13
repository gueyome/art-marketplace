require 'rails_helper'

RSpec.describe "pages/index.html.erb", type: :view do

  context 'it says welcome' do
    it "displays 'welcome'" do
      # génére la page
      render
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Bienvenue'
    end
  end

  context 'other context' do  
    it 'should display something' do
      # ton test
    end
  end

end