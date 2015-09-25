require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/new'

describe Admin::Controllers::Books::New do
  let(:action) { Admin::Controllers::Books::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
