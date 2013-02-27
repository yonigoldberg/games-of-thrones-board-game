require 'spec_helper'

describe 'card' do
  describe 'basic validation' do
    it 'has a valid factory' do
      create(:card).should be_valid
  end
end

end