require 'features_helper'

describe 'List books' do
  before do
    BookRepository.clear

    BookRepository.create(Book.new(title: 'Practical Vim', author: 'Drew Neil'))
    BookRepository.create(Book.new(title: 'Programming Ruby 1.9 & 2.0',
                                   author: 'Dave Thomas'))
  end

  it 'displays each book on the page' do
    visit '/books'
    expect(page).to have_css '.book', count: 2
  end
end
