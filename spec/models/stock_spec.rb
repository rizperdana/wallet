require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe Stock, type: :model do
    it { should have_one :wallet }
    it { should validate_presence_of :name }
  end
end
