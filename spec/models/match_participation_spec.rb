require "models/application_record"
require "models/competitor"
require "models/match"
require "models/match_participation"

RSpec.describe Fanboy::Models::MatchParticipation, type: :model do

  describe "associations" do
    it "belongs to a competitor" do
      expect(subject).to belong_to :competitor
    end

    it "belongs to a match" do
      expect(subject).to belong_to :match
    end
  end

  describe "validations" do
    it "ensures competitor is present" do
      expect(subject).to validate_presence_of :competitor
    end

    it "ensures match is present" do
      expect(subject).to validate_presence_of :match
    end
  end
end
