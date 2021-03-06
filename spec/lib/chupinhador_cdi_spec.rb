require 'spec_helper'

describe ChupinhadorCdi do
  let(:data) { Date.new(2014, 9, 11) }
  let(:taxa) { 10.81 }

  before do
    stream = File.read("spec/support/cetip.html")
    allow(RestClient).to receive(:get).with('http://www.cetip.com.br/').and_return(stream)
  end

  subject { ChupinhadorCdi.new }

  it { expect(subject).to respond_to :chupinhar }

  describe '#chupinhar' do
    before { subject.chupinhar }

    it { expect(subject.taxa).to eql taxa }
    it { expect(subject.data).to eql data }

    context 'quando ocorre erro' do
      before do
        allow(RestClient).to receive(:get).and_raise('algum erro')
        expect(Rails.logger).to receive(:error)
      end

      it { expect { subject.chupinhar }.not_to raise_error  }
    end
  end

end
