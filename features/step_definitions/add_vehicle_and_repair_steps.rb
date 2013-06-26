When 'I fill out the date fields' do
  select '2010', from: 'vehicle_purchased_on_1i'
  select 'January', from: 'vehicle_purchased_on_2i'
  select '20', from: 'vehicle_purchased_on_3i'
end

When 'I fill out repair date fields' do
  select '2010', from: 'repair_date_1i'
  select 'January', from: 'repair_date_2i'
  select '23', from: 'repair_date_3i'
end
