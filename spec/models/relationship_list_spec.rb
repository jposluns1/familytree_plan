require 'rails_helper'

RSpec.describe RelationshipList, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:connection) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
