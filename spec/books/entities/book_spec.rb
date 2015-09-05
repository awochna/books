require 'spec_helper'

RSpec.describe Book do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Practical Vim')
    expect(book.title).to eq 'Practical Vim'
  end

  it 'can have an author' do
    book = Book.new(title: 'Practical Vim', author: 'Drew Neil')
    expect(book.author).to eq 'Drew Neil'
  end

  it 'can describe how far I have read in the book' do
    book = Book.new(title: 'Practical Object Oriented Design in Ruby',
                    author: 'Sandi Metz', percent_read: 100)
    expect(book.percent_read).to eq 100
  end

  describe 'when a book is 100 percent read' do
    let(:book) { Book.new(title: 'Practical Object Oriented Design in Ruby',
                          author: 'Sandi Metz', percent_read: 100) }

    it 'knows it is finished' do
      expect(book.finished?).to be true
    end
  end
end
