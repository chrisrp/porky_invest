require 'spec_helper'

describe ChupinhadorSelic do
  let(:taxa) { 10.90 }
  let(:data) { Date.new(Time.now.year, 9, 29) }

  before do
    stream = File.read('spec/support/bcb.html')
    allow(RestClient).to receive(:get).with('http://www.bcb.gov.br/pt-br/paginas/default.aspx').and_return(stream)
  end

  subject { ChupinhadorSelic.new }

  describe '#chupinhar' do
    before { subject.chupinhar }

    it { expect(subject.taxa).to eql taxa }
    it { expect(subject.data).to eql data }
  end

  context 'quando ocorre erro' do
    before do
      allow(RestClient).to receive(:get).and_raise('erro qualquer')
      expect(Rails.logger).to receive(:error)
    end

    it { expect { subject.chupinhar }.not_to raise_error  }
  end
end
