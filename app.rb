require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/doctor")
require("./lib/patient")
require("pg")
require("pry")

DB = PG.connect({:dbname => "doctors_office"})

get("/") do
  erb(:index)
end

get("/doctors") do
  @doctors = Doctor.all()
  erb(:doctors)
end

get("/doctors_form") do
  erb(:doctors_form)
end

post("/doctors") do
  name = params.fetch("name")
  specialty = params.fetch("specialty")
  if !name.empty? && !specialty.empty?
    doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
    doctor.save
  end
  erb(:doctors_success)
end
