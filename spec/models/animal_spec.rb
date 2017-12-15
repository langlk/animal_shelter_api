require "rails_helper"

describe Animal do
  it { should validate_presence_of :name }
  it { should validate_presence_of :species }
  it { should validate_presence_of :sex }
  it { should validate_presence_of :birthday }
  it { should validate_presence_of :arrival_date }

  describe '#birthday_valid' do
    it "should prevent save if birthday is not in the future" do
      animal = FactoryBot.build(:animal, birthday: Date.today + 2.day, arrival_date: Date.today + 2.day)
      expect(animal.save).to eq(false)
    end

    it "should allow save if birthday is today or earlier" do
      animal = FactoryBot.build(:animal, birthday: Date.today, arrival_date: Date.today)
      expect(animal.save).to eq(true)
    end
  end

  describe '#arrival_date_valid' do
    it "should prevent save if arrival date is before birthday" do
      animal = FactoryBot.build(:animal, birthday: Date.today - 5.day, arrival_date: Date.today - 6.day)
      expect(animal.save).to eq(false)
    end

    it "should prevent save if arrival date is in the future" do
      animal = FactoryBot.build(:animal, arrival_date: Date.today + 7.day)
      expect(animal.save).to eq(false)
    end

    it "should allow save if arrival date is between birthday and today, inclusive" do
      animal = FactoryBot.build(:animal, arrival_date: Date.today, birthday: Date.today)
      expect(animal.save).to eq(true)
    end
  end

  describe '.random' do
    it "returns a random animal" do
      animals = FactoryBot.create_list(:animal, 10)
      expect(animals.include?(Animal.random)).to eq(true)
    end
  end

  describe '.search' do
    it "finds all animals with a name that partially matches the search term" do
      a1 = FactoryBot.create(:animal, name: 'Catherine')
      a2 = FactoryBot.create(:animal, name: 'Cathy')
      a3 = FactoryBot.create(:animal, name: 'Kathleen')
      expect(Animal.search('Cath')).to eq([a1, a2])
    end

    it "finds all animals with a description that partially matches the search term" do
      a1 = FactoryBot.create(:animal, description: 'Quiet and calm dog, greate with kids.')
      a2 = FactoryBot.create(:animal, description: 'Rowdy young puppy, needs lots of attention.')
      a3 = FactoryBot.create(:animal, description: 'Shy older dog, prefers a quiet home.')
      expect(Animal.search('quiet')).to eq([a1, a3])
    end

    it "finds all animals with a species that paritially matches search term" do
      a1 = FactoryBot.create(:animal, species: 'Catbug')
      a2 = FactoryBot.create(:animal, species: 'Norwegian forest cat')
      a3 = FactoryBot.create(:animal, species: 'Tiger')
      expect(Animal.search('cat')).to eq([a1, a2])
    end
  end
end
