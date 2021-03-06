require 'spec_helper'

describe Icalendar::Values::DateOrDateTime do

  subject { described_class.new value, params }
  let(:params) { {} }

  describe '#call' do
    context 'DateTime value' do
      let(:value) { '20140209T194355Z' }

      it 'returns a DateTime object' do
        expect(subject.call).to be_a_kind_of(Icalendar::Values::DateTime)
      end

      it 'has the proper value' do
        expect(subject.call.value).to eq DateTime.new(2014, 2, 9, 19, 43, 55)
      end
    end

    context 'Date value' do
      let(:value) { '20140209' }

      it 'returns a Date object' do
        expect(subject.call).to be_a_kind_of(Icalendar::Values::Date)
      end

      it 'has the proper value' do
        expect(subject.call.value).to eq Date.new(2014, 2, 9)
      end
    end
  end
end
