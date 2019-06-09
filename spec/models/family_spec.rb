require 'rails_helper'

RSpec.describe Family, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:family_member_matches) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
