# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

roles = [
  { role: 'president' },
  { role: 'vice-president' },
  { role: 'treasurer' },
  { role: 'secretary' },
  { role: 'member at large' }
]

# Create positions with predefined roles
roles.each do |role_params|
  Position.find_or_create_by(role_params)
end

departments = [
  { department: 'Fisheries and Oceans Canada' },
  { department: 'Natural Resources Canada' },
  { department: 'Health Canada' },
  { department: 'Environment and Climate Change Canada' },
  { department: 'Indigenous Services Canada' }
]

departments.each do |department_params|
  Department.find_or_create_by(department_params)
end

regions = [
  { region: 'Atlantic' },
  { region: 'BC-Yukon' },
  { region: 'National Capital Region' },
  { region: 'Ontario' },
  { region: 'Prairies/NWT' },
  { region: 'Quebec' }
]

regions.each do |region_params|
  Region.find_or_create_by(region_params)
end

classifications = [
  { classification: 'AC' },
  { classification: 'AG' },
  { classification: 'BI' },
  { classification: 'CH' },
  { classification: 'FO' },
  { classification: 'MT' },
  { classification: 'PC' },
  { classification: 'SG-SRE' },
  { classification: 'SG-PAT' }
]

classifications.each do |classification_params|
  Classification.find_or_create_by(classification_params)
end