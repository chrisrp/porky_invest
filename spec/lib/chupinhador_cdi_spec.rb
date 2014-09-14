require 'spec_helper'

describe ChupinhadorCdi do

  before do
    stream = File.read("spec/support/cetip.html")
    allow(RestClient).to receive(:get).with('http://www.cetip.com.br/').and_return(stream)
 end

  subject { ChupinhadorCdi.new }

  it { expect(subject).to respond_to :chupinhar }

  describe '#chupinhar' do
    before { subject.chupinhar }

    it { expect(subject.taxa).to eql 10.81 }
    it { expect(subject.data).to eql '11/09/2014' }
  end

end
