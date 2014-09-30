require 'spec_helper'

describe ChupinhadorSelic do
  let(:taxa) { 10.90 }

  before do
    stream = File.read("spec/support/bcb.html")
    allow(RestClient).to receive(:get).with('http://www.bcb.gov.br/pt-br/paginas/default.aspx').and_return(stream)
  end

  subject { ChupinhadorSelic.new }

  it { expect(subject).to respond_to :chupinhar }

  describe '#chupinhar' do
    before { subject.chupinhar }

    it { expect(subject.taxa).to eql taxa }
  end




end
