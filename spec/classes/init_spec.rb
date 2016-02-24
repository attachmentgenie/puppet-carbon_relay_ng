require 'spec_helper'
describe 'carbon_relay_ng' do

  context 'with defaults for all parameters' do
    it { should contain_class('carbon_relay_ng') }
  end
end
