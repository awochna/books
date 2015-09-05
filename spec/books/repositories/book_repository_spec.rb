require 'spec_helper'

RSpec.describe BookRepository do
  let(:finished_book) { Book.new(title: 'POODR', author: 'Sandi Metz',
                                 percent_read: 100) }
  let(:unfinished_book) { Book.new(title: 'The Agile Samurai',
                                   author: 'Jonathan Rasmusson',
                                   percent_read: 30) }

  before do
    BookRepository.clear
  end

  describe 'can query books by progress' do
    before do
      BookRepository.create(finished_book)
      BookRepository.create(unfinished_book)
    end

    specify 'for finished books' do
      collection = BookRepository.finished
      expect(collection[0].title).to eq finished_book.title
      expect(collection[1]).to be nil
    end

    specify 'for unfinished books' do
      collection = BookRepository.unfinished
      expect(collection[0].title).to eq unfinished_book.title
      expect(collection[1]).to be nil
    end
  end
end
