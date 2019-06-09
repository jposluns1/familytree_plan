require 'rails_helper'

RSpec.describe PartnerMatch, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:member_2) }

    it { should belong_to(:member) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
