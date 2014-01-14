require 'spec_helper'

module NetsuiteIntegration
  describe Services::NonInventoryItemService do
    include_examples "config hash"

    subject { described_class.new config }

    context '#find_or_create_by_name' do
      it 'returns the item' do
        VCR.use_cassette("non_inventory_item/find_or_create") do
          expect(subject.find_or_create_by_name('Spree Taxes').internal_id).to eq("1124")
        end
      end

      it 'creates and returns the item' do
        VCR.use_cassette("non_inventory_item/create") do
          expect(subject.find_or_create_by_name('Spree Discount').internal_id).to eq("1225")
        end
      end
    end
  end
end
