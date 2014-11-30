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

    context 'quando o email excede o limite' do
      let(:email) { 'a' * 51 }
      it { expect(subject).not_to be_valid }
    end

    context 'quando o nome excede o limite' do
      let(:nome) { 'a' * 51 }
      it { expect(subject).not_to be_valid }
    end

    context 'quando o email não é valido' do
      let(:email) { 'abc.com.br' }
      it { expect(subject).not_to be_valid }
    end

    context 'quando o email não é unico' do
      let(:email) { 'chris@abc.com' }
      before  { Usuario.new(nome: 'chris', email: 'chris@abc.com').save }

      it { expect(subject).not_to be_valid }
    end
  end


end
