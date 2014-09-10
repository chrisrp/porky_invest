require 'spec_helper'

describe IndiceCdi do
  let(:indice) { { data: '01/01/2014', taxa_di: 10.8 }  }

 subject { IndiceCdi.new(indice) }

 it { expect(subject.data).to eql Date.new(2014,1,1) }
 it { expect(subject.taxa_di).to eql 10.8 }


end
