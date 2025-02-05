require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
    it "renders the home index template" do
    render
    expect(response).to render_template(:index)
  end

  it "displays the correct title" do
    render
    expect(rendered).to have_content("Busca CEP")
  end

  it "has a specific link" do
    render
    expect(rendered).to have_button("Buscar")
  end
end
