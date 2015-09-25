require 'spec_helper'
require_relative '../../../../apps/admin/views/books/create'

describe Admin::Views::Books::Create do
  let(:exposures) { Hash[book: Book.new()] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/create.html.erb') }
  let(:view)      { Admin::Views::Books::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #book" do
    expect(view.book).to eq exposures.fetch(:book)
  end
end
