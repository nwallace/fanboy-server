require_relative "../../lib/models/title"
require_relative "../../lib/models/tournament"

RSpec.describe Fanboy::Models::Title, type: :model do

  describe "associations" do
    it "has many tournaments" do
      expect(subject).to have_many :tournaments
    end
  end

  describe "validations" do
    subject { build(:title) }

    it "is valid when all required data is present and correct" do
      expect(subject).to be_valid
    end

    it "ensures name is present" do
      expect(subject).to validate_presence_of(:name)
    end

    it "ensures nickname is present" do
      expect(subject).to validate_presence_of(:nickname)
    end

    it "ensures slug is present" do
      expect(subject).to validate_presence_of(:slug)
    end

    it "ensures developer is present" do
      expect(subject).to validate_presence_of(:developer)
    end

    it "ensures priority is present" do
      expect(subject).to validate_presence_of(:priority)
    end
  end
end
