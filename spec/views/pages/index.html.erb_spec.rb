require 'rails_helper'

RSpec.describe "pages/_jumbotron.html.erb", type: :view do

  context 'it says welcome' do  
    it "displays 'Welcome'" do
      render
      expect(rendered).to have_content 'Welcome'
    end
  end
end