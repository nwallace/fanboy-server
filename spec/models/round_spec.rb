require "models/application_record"
require "models/tournament"
require "models/match"
require "models/round"

RSpec.describe Fanboy::Models::Round, type: :model do

  describe "associations" do
    it "belongs to a tournament" do
      expect(subject).to belong_to :tournament
    end

    it "has many matches" do
      expect(subject).to have_many :matches
    end
  end

  describe "validations" do
    it "ensures tournament is present" do
      expect(subject).to validate_presence_of :tournament
    end

    it "ensures name is present" do
      expect(subject).to validate_presence_of :name
    end

    it "ensures sort order is present" do
      expect(subject).to validate_presence_of :sort_order
    end
  end
end
