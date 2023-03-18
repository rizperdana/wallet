require 'rails_helper'

RSpec.describe User, type: :model do
  describe User, type: :model do
    it { should have_one :wallet }
    it { should validate_presence_of :name }
  end
end
