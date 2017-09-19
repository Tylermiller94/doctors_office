require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'assign doctor to patient', {:type => :feature} do
  it 'allows a user to click on a doctor and see a list of their patients/details of patient' do
    visit('/')
    click_link('add new doctor')
    fill_in('name', :with => 'Mr. Smith')
    click_button('add doctor')
    expect(page.find('//h1')).to have_content('Success!')
  end
end

describe 'view all of the doctors', {:type => :feature} do
  it 'allows user to see all  othe the doctors that have been added' do
    doc = Doctor.new({:name => "Dr. Smith", :specialty => "Dentist", :id => nil})
    doc.save
    visit('/')
    click_link('view all doctors')
    expect(page).to have_content("Dr. Smith")
  end
end
