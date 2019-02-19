require "models/application_record"
require "models/title"
require "models/map"
require "models/match"

RSpec.describe Fanboy::Models::Map, type: :model do

  describe "associations" do
    it "belongs to a title" do
      expect(subject).to belong_to :title
    end

    it "has many matches" do
      expect(subject).to have_many :matches
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
