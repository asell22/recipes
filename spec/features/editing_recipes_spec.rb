require 'rails_helper'

feature "Editing Recipes" do
  before do
    FactoryGirl.create(:recipe, name: "Bowl of Cereal")

    visit "/"
    click_link "Bowl of Cereal"
    click_link "Edit Recipe"
  end

  scenario "Updating a recipe" do
    fill_in "Name", with: "Bowl of Fruit Loops"
    click_button "Edit Recipe"

    expect(page).to have_content("Recipe has been edited")
  end

  scenario "Updating with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Edit Recipe"

    expect(page).to have_content("Recipe has not been edited")
  end
end
