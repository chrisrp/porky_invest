require 'spec_helper'

describe Usuario do
  let(:nome) { 'chris' }
  let(:email) { '123@chris.com.br' }
  let(:senha) { 'foobar' }


  subject { Usuario.new(nome: nome, email: email, password: senha, password_confirmation: senha ) }

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
      before  { Usuario.new(nome: 'chris2', email: 'chris@abc.com', password: 'lala', password_confirmation: 'lala').save! }

      it { expect(subject).not_to be_valid }
    end

    context 'quando a senha é menor que 4 chars' do
      let(:senha) { 'foo' }
      it { expect(subject).not_to be_valid }
    end
  end

  context 'quando o email é maiusculo' do
    let(:email) { '123@CHRIS.COM.BR' }

    before { subject.save! }

    it { expect(subject.email).to eq '123@chris.com.br' }
  end
end
