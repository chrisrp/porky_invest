require 'spec_helper'

describe IndiceDiario do
  let(:data) { '01/01/2014' }
  let(:taxa_di) { 10.8 }

  let(:indice) { { data: data, taxa_di: taxa_di }  }

  before { allow_any_instance_of(ChupinhadorCdi).to receive(:chupinhar).and_return('') }

  subject { IndiceDiario.new(indice) }

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

  describe '#carregar_ultimo_indice_cdi' do
    context 'quando já existe taxa para o dia' do
      let(:taxa_do_dia) { FactoryGirl.create(:indice_diario, data: Date.today) }

      before do
        allow_any_instance_of(ChupinhadorCdi).to receive(:data).and_return(Date.today)
        taxa_do_dia
      end

      subject { IndiceDiario.carregar_ultimo_indice_cdi }

      it { expect(subject).to eql taxa_do_dia }
    end

    context 'quando não existe taxa cadastrada' do
      let(:taxa_de_ontem) { FactoryGirl.create(:indice_diario, data: Date.today - 1) }
      let(:ultimo_indice) { IndiceDiario.new(data: Date.today, taxa_di: 10.91) }

      before do
        taxa_de_ontem
        allow_any_instance_of(ChupinhadorCdi).to receive(:taxa).and_return(ultimo_indice.taxa_di)
        allow_any_instance_of(ChupinhadorCdi).to receive(:data).and_return(ultimo_indice.data)
      end

      subject { IndiceDiario.carregar_ultimo_indice_cdi }

      it { expect(subject.data).to eql ultimo_indice.data }
      it { expect(subject.taxa_di).to eql ultimo_indice.taxa_di }
    end

  end
end
