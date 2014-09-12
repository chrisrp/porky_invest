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

  describe '#carregar_da_cetip' do
    it { expect(IndiceCdi).to respond_to(:carregar_da_cetip)  }

    context 'quando não já existe taxa para o dia' do
      let(:taxa_do_dia) { FactoryGirl.create(:indice_cdi, data: Date.today) }
      before { taxa_do_dia }

      subject { IndiceCdi.carregar_da_cetip }

      it { expect(subject).to eql taxa_do_dia }
    end

    context 'quando não existe taxa cadastrada' do
      before { pending }

      let(:taxa_de_ontem) { FactoryGirl.create(:indice_cdi, data: Date.today - 1) }
      let(:taxa_cetip) { IndiceCdi.new(data: Date.today, taxa_di: 10.91).save }

      before { taxa_de_ontem }

      subject { IndiceCdi.carregar_da_cetip }

      it { expect(subject).to eql taxa_cetip }

    end


  end
end
