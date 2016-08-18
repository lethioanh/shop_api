require 'rails_helper'
require 'action_view'
RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it {should be_a PgSearch}

  describe '.search_by' do
    let(:relation) {double}
    before { except(Product).to receive(:page).with(1).and_return(relation)}
    # before { except(Product).to receive(:all).and_return(relation)}

    context do
      # it { except {Product.search_by}.to_not raise_error}
      it { except {Product.search_by('page' => 1)}.to_not raise_error}
    end

    context do
      before { expect(relation).to receive(:search).with('word')}
      it { expect { Product.search_by 'page' => 1, 'name' => 'word'}.to_not raise_error}
    end

    context do
      before {except(relation).to receive(:where).with('name LIKE ?', 'abc%')}
      # it {except { Product.search_by 'term' => 'abc'}.to_not raise_error}
      it {except { Product.search_by 'page' => '1', 'term' => 'abc'}.to_not raise_error}
    end

  end
end
