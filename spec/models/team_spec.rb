require 'rails_helper'

RSpec.describe Team, type: :model do
  describe Team, type: :model do
    it { should have_one :wallet }
    it { should validate_presence_of :name }
  end
end
