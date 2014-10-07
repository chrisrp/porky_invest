require 'spec_helper'

describe IndiceDiario do
  let(:data) { '01/01/2014' }
  let(:taxa_di) { 10.8 }
  let(:taxa_selic) { 10.9 }

  let(:indice) { { data: data, taxa_di: taxa_di, taxa_selic: taxa_selic }  }

  before { allow_any_instance_of(ChupinhadorCdi).to receive(:chupinhar).and_return('') }

  subject { IndiceDiario.new(indice) }

  it { expect(subject.data).to eql Date.new(2014,1,1) }
  it { expect(subject.taxa_di).to eql taxa_di }
  it { expect(subject.taxa_selic).to eql taxa_selic }

  describe '#valid?' do
    context 'sem data' do
      let(:data) { nil }

      it { expect(subject).not_to be_valid }
    end

    context 'sem taxa di e sem taxa selic' do
      let(:taxa_di) { nil }
      let(:taxa_selic) { nil }

      it { expect(subject).not_to be_valid }
    end

    context 'com taxa di e sem taxa selic' do
      let(:taxa_di) { 10.5 }
      let(:taxa_selic) { nil }

      it { expect(subject).to be_valid }
    end

    context 'com taxa di e sem taxa selic' do
      let(:taxa_di) { nil }
      let(:taxa_selic) { 10.0 }

      it { expect(subject).to be_valid }
    end
  end

  context 'com data pt-br' do
    let(:data) { '31/12/2014' }

    it { expect(subject.data).to eql Date.new(2014, 12, 31) }
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

    context "quando existe selic, mas nao existe di" do
      let(:taxa_do_dia) { FactoryGirl.create(:indice_diario, data: Date.today, taxa_selic: 10.9, taxa_di: nil) }

      before do
        allow_any_instance_of(ChupinhadorCdi).to receive(:data).and_return(Date.today)
        allow_any_instance_of(ChupinhadorCdi).to receive(:taxa).and_return(10.83)
        taxa_do_dia
      end

      subject { IndiceDiario.carregar_ultimo_indice_cdi }

      it { expect(subject.taxa_di).to eql 10.83 }
    end
  end

  describe '#carregar_ultima_taxa_selic' do
    context 'quando já existe taxa do dia' do
      let(:taxa_do_dia) do
        FactoryGirl.create(:indice_diario,
                           data: Date.today,
                           taxa_selic: 10.5,
                           taxa_di: nil)
      end

      before do
        taxa_do_dia
        allow_any_instance_of(ChupinhadorSelic).to receive(:chupinhar)
        allow_any_instance_of(ChupinhadorSelic).to receive(:data).and_return(Date.today)
      end

      subject { IndiceDiario.carregar_ultima_taxa_selic }

      it { expect(subject).to eql taxa_do_dia }
    end

    context 'quando não existe taxa selic cadastrada' do
      before do
        allow_any_instance_of(ChupinhadorSelic).to receive(:data).and_return(Date.today)
        allow_any_instance_of(ChupinhadorSelic).to receive(:taxa).and_return(10.4)
      end

      subject { IndiceDiario.carregar_ultima_taxa_selic }

      it { expect(subject.data).to eql Date.today }
      it { expect(subject.taxa_selic).to eql 10.4 }
    end

    context 'quando existe taxa di mas não selic' do
      before do
        FactoryGirl.create(:indice_diario, data: Date.today)
        allow_any_instance_of(ChupinhadorSelic).to receive(:taxa).and_return(10.2)
        allow_any_instance_of(ChupinhadorSelic).to receive(:data).and_return(Date.today)
      end

      subject { IndiceDiario.carregar_ultima_taxa_selic }

      it { expect(subject.data).to eql Date.today }
      it { expect(subject.taxa_selic).to eql 10.2 }
    end
  end

end
