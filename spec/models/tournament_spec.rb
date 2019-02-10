require "db_helper"
require_relative "../../lib/models/title"
require_relative "../../lib/models/tournament"

RSpec.describe Fanboy::Models::Tournament, type: :model do

  describe "associations" do
    it "belongs to a title" do
      expect(subject).to belong_to :title
    end
  end

  describe "validations" do
    subject { build(:tournament) }

    it "is valid when all required data is present and correct" do
      expect(subject).to be_valid
    end

    it "ensures the title is present" do
      expect(subject).to validate_presence_of(:title)
    end

    it "ensures name is present" do
      expect(subject).to validate_presence_of(:name)
    end

    it "ensures starts is present" do
      expect(subject).to validate_presence_of(:starts)
    end
  end
end
