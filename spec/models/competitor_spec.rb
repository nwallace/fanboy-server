require "models/application_record"
require "models/title"
require "models/competitor"

RSpec.describe Fanboy::Models::Competitor, type: :model do

  describe "associations" do
    it "belongs to a title" do
      expect(subject).to belong_to :title
    end
  end

  describe "validations" do
    it "ensures title is present" do
      expect(subject).to validate_presence_of :title
    end

    it "ensures name is present" do
      expect(subject).to validate_presence_of :name
    end
  end
end
