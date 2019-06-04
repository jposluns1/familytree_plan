require 'rails_helper'

RSpec.describe Connection, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:relationship_list) }

    it { should have_many(:notes) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:image) }
      
    end
end
