require 'spec_helper'

describe IndiceCdi do
  let(:data) { '01/01/2014' }
  let(:taxa_di) { 10.8 }

  let(:indice) { { data: data, taxa_di: taxa_di }  }

  subject { IndiceCdi.new(indice) }

  it { expect(subject.data).to eql Date.new(2014,1,1) }
  it { expect(subject.taxa_di).to eql taxa_di }

  describe '#valid?' do
    context 'sem data' do
      let(:data) { nil }

      it { expect(subject).not_to be_valid }
    end

    context 'sem taxa' do
      let(:taxa_di) { nil }

      it { expect(subject).not_to be_valid }
    end
  end

  context 'com data pt-br' do
    let(:data) { '31/12/2014' }

    it { expect(subject.data).to eql Date.new(2014,12,31) }
  end

  describe '#carregar_ultima_taxa' do
    it { expect(IndiceCdi).to respond_to(:carregar_ultima_taxa)  }

    context 'quando não já existe taxa para o dia' do
      before do
        FactoryGirl.create(:indice_cdi, data: Date.new(2014,9,1))
        #terminar :'(
      end




    end


  end
end
