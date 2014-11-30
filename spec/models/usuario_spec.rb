require 'spec_helper'

describe Usuario do
  let(:nome) { 'chris' }
  let(:email) { '123@chris.com.br' }


  subject { Usuario.new(nome: nome, email: email) }

  describe '#valid' do

    it { expect(subject).to be_valid }

    context 'quando não tem nome' do
      let(:nome) { nil }
      it { expect(subject).not_to be_valid }
    end

    context 'quando não tem email' do
      let(:email) { nil }
      it { expect(subject).not_to be_valid }
    end
  end


end
