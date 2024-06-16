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
  { role: 'President' },
  { role: 'Vice-President' },
  { role: 'Treasurer' },
  { role: 'Secretary' },
  { role: 'Member at Large' },
  { role: 'None' }
]

# Create positions with predefined roles
roles.each do |role_params|
  Position.find_or_create_by(role_params)
end

departments = [
  { name: 'Fisheries and Oceans Canada' },
  { name: 'Natural Resources Canada' },
  { name: 'Health Canada' },
  { name: 'Environment and Climate Change Canada' },
  { name: 'Indigenous Services Canada' }
]

departments.each do |department_params|
  Department.find_or_create_by(department_params)
end

regions = [
  { name: 'Atlantic' },
  { name: 'BC-Yukon' },
  { name: 'National Capital Region' },
  { name: 'Ontario' },
  { name: 'Prairies/NWT' },
  { name: 'Quebec' }
]

regions.each do |region_params|
  Region.find_or_create_by(region_params)
end

classifications = [
  { name: 'AC' },
  { name: 'AG' },
  { name: 'BI' },
  { name: 'CH' },
  { name: 'FO' },
  { name: 'MT' },
  { name: 'PC' },
  { name: 'SG-SRE' },
  { name: 'SG-PAT' }
]

classifications.each do |classification_params|
  Classification.find_or_create_by(classification_params)
end

subgroups = [
  { name: "SP 123 Main Street, Winnipeg" },
  { name: "SP 401 Burrard Street" },
  { name: "SP 4900 Yonge St - Toronto" },
  { name: "SP 50 Victoria St, Place du Portage" },
  { name: "SP 501 University Crescent" },
  { name: "SP Confederation Heights Plus" },
  { name: "SP Downtown Edmonton" },
  { name: "SP ECC Toronto" },
  { name: "SP Edmonton" },
  { name: "SP Est Québec" },
  { name: "SP Fredericton" },
  { name: "SP Gander" },
  { name: "SP Hamilton-Burlington" },
  { name: "SP Mainland Nova Scotia" },
  { name: "SP Moncton" },
  { name: "SP Montréal" },
  { name: "SP NCR" },
  { name: "SP Nanaimo" },
  { name: "SP Quebec-City - NRCAN" },
  { name: "SP Scarborough" },
  { name: "SP South Saskatchewan" },
  { name: "SP St-Hyacinthe" },
  { name: "SP St. Andrews" },
  { name: "SP St. John's" },
  { name: "SP Tunney's Plus" },
  { name: "SP Vancouver" },
  { name: "SP Victoria" },
  { name: "SP Winnipeg Central" },
  { name: "SP Winnipeg" },
  { name: "SP Yellowknife" },
  { name: "SP Yukon" },
  { name: 'None' }
]

subgroups.each do |subgroup_params|
  Subgroup.find_or_create_by(subgroup_params)
end


roles = [
  { role: 'President' },
  { role: 'Vice-President' },
  { role: 'Treasurer' },
  { role: 'Secretary' },
  { role: 'Chief Steward'  },
  { role: 'Communications Coordinator' },
  { role: 'Delegate Coordinator'  },
  { role: ' Membership Coordinator' },
  { role: 'Bargaining Team Coordinator' },
  { role: 'Mobilization Coordinator' },
  { role: 'Recognition Coordinator' },
  { role: 'Parliamentarian' },
  { role: 'None' }

]

roles.each do |role_params|
  Executive.find_or_create_by(role_params)
end