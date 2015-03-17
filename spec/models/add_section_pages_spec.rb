require 'rails_helper'

describe 'add a section process' do
  it 'adds a section' do
    chapter = Chapter.create(:title => 'Test 1')
    visit section_path(section)
    click on 'Add section'
    fill_in 'Title', :with => 'Stuff1'
    click_on 'Create Section'
    expect(page).to have_content 'Sections'
  end
end
