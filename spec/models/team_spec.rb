require 'rails_helper'

RSpec.describe Team, type: :model do
  describe Team, type: :model do
    it { should validate_presence_of :name }
    it_behaves_like 'a wallet owner' do
      let(:object) { create :team }
    end
  end
end
