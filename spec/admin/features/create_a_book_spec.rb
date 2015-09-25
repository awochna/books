require 'features_helper'

describe 'Create a new book' do
  before do
    BookRepository.clear
  end

  describe 'form' do
    before do
      visit '/admin/books/new'
    end

    it 'should have title field' do
      expect(page).to have_field 'Title'
    end

    it 'should have author field' do
      expect(page).to have_field 'Author'
    end

    it 'should have percent read field' do
      expect(page).to have_field 'Percent Read'
    end

    it 'should create a new book' do
      fill_in 'Title', with: 'Practical Vim'
      fill_in 'Author', with: 'Drew Neil'
      fill_in 'Percent Read', with: '75'

      click_button 'Create Book'

      visit '/books'
      expect(page).to have_content 'Practical Vim'
    end
  end
end
