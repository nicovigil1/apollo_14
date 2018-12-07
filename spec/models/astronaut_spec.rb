require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Analyitics' do
    it 'can calculate average age' do
      Astronaut.create(name:"Billy Joel", age:"10", job:"Piano Man")
      Astronaut.create(name:"Elton John", age:"20", job:"Tiny Dancer")

      expect(Astronaut.avg_age).to eq(15)
    end 
  end 
end
