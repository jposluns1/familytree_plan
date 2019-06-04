require 'rails_helper'

RSpec.describe Note, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:commenter_id) }

    it { should validate_presence_of(:connection_id) }
      
    end
end
