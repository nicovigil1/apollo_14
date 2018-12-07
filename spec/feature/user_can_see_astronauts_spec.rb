require 'rails_helper'

RSpec.describe 'as a visitor' do
    describe 'when I visit /astronauts' do 
        
        it 'can see astronauts' do
            Astronaut.create(name:"Billy Joel", age:"21", job:"Piano Man")
            Astronaut.create(name:"Elton John", age:"22", job:"Tiny Dancer")
            visit '/astronauts'
            save_and_open_page
            expect(page).to have_content("Name: Billy Joel")
            expect(page).to have_content("Age: 21")
            expect(page).to have_content("Job: Piano Mam")
            expect(page).to have_content("Job: Tiny Dancer")
        end 
    end
end



