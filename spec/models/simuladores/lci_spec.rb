require 'spec_helper'

# para testar contra o site da cetip utilizar o
# periodo de 11/09/2014 até 23/09/2014

describe Simuladores::Lci do
  let(:taxa) { 10.81 }
  let(:dias) { 8 }
  let(:percentual) { 100 }
  let(:valor) { 1000 }

  subject { Simuladores::Lci.new(taxa, dias, percentual, valor) }

  describe '#simular!' do
    before { subject.simular }

    it { expect(subject.montante).to eql  1003.26 }

    context 'com percentual quebrado' do
      let(:percentual) { 84.2500 }

      it { expect(subject.montante).to eql  1002.75 }
    end

    context 'com valor e percentual quebrados' do
      let(:percentual) { 84.2500 }
      let(:valor) { 2001 }

      it { expect(subject.montante).to eql  2006.50 }
    end

    context 'com numeros realmente quebrados' do
      let(:percentual) { 84.251 }
      let(:valor) { 1999.14 }

      it { expect(subject.montante).to eql  2004.64 }
    end

  end
end

