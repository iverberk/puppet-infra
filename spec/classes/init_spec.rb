require 'spec_helper'
describe 'infra' do

  context 'with defaults for all parameters' do
    it { should contain_class('infra') }
  end
end
