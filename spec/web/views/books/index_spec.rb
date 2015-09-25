require 'spec_helper'
require_relative '../../../../apps/web/views/books/index'

describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: Book.new(title: 'Practical Vim', author: 'Drew Neil')] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #books" do
    expect(view.books).to eq exposures.fetch(:books)
  end
end
