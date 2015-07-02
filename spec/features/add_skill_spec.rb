require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add Even More Skills'
    fill_in 'Name', :with => 'Skill 1'
    fill_in 'Description', :with => 'Stupid test'
    click_on 'Create Skill'
    expect(page).to have_content 'Skill 1'
  end
end