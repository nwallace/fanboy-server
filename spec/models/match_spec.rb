require "models/application_record"
require "models/round"
require "models/map"
require "models/match"
require "models/match_participation"

RSpec.describe Fanboy::Models::Match, type: :model do

  describe "associations" do
    it "belongs to a round" do
      expect(subject).to belong_to :round
    end

    it "belongs to a map" do
      expect(subject).to belong_to :map
    end

    it "has many match participations" do
      expect(subject).to have_many :match_participations
    end
  end

  describe "validations" do
    it "ensures round is present" do
      expect(subject).to validate_presence_of :round
    end

    it "ensures map is present" do
      expect(subject).to validate_presence_of :map
    end

    it "ensures best of is present" do
      expect(subject).to validate_presence_of :best_of
    end

    it "ensures sort order is present" do
      expect(subject).to validate_presence_of :sort_order
    end
  end
end
