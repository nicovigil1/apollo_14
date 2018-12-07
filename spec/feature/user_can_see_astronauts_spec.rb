require 'rails_helper'

RSpec.describe 'as a visitor' do
    describe 'when I visit /astronauts' do 
        
        it 'can see astronauts' do
            Astronaut.create(name:"Billy Joel", age:"21", job:"Piano Man")
            Astronaut.create(name:"Elton John", age:"22", job:"Tiny Dancer")
            visit '/astronauts'

            expect(page).to have_content("Name: Billy Joel")
            expect(page).to have_content("Age: 21")
            expect(page).to have_content("Job: Piano Man")
            expect(page).to have_content("Job: Tiny Dancer")
        end 

        it 'can see average age of the astronauts' do 
            Astronaut.create(name:"Billy Joel", age:"10", job:"Piano Man")
            Astronaut.create(name:"Elton John", age:"20", job:"Tiny Dancer")
            visit '/astronauts'

            expect(page).to have_content("Average Age: 15")
        end 

        it 'can see the missions of each' do 
            joel = Astronaut.create(name:"Billy Joel", age:"10", job:"Piano Man")
            john = Astronaut.create(name:"Elton John", age:"20", job:"Tiny Dancer")
            joel.missions.create(title:"New York State of Mind")
            john.missions.create(title:"Your Song")


            visit '/astronauts'
            # add within if time 
            expect(page).to have_content("New York State of Mind")
            expect(page).to have_content("Your Song")
        end 

    end
end



