require 'rails_helper'

RSpec.describe FamilyMemberMatch, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:family) }

    it { should belong_to(:member) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
