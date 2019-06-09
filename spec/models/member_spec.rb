require 'rails_helper'

RSpec.describe Member, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:family_member_matches) }

    it { should have_one(:partner_2) }

    it { should have_one(:partner_1) }

    it { should have_many(:notes) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
