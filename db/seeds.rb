password = 'pass12345'
1.upto(5) do |i|
  customer = Customer.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: nil,
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password,
    mobile_number: "09495939582",
    zip_code: "1403",
    card_detail: "9127381273",
  )

  tasker = Tasker.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: nil,
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password,
    mobile_number: "09495939582",
    zip_code: "1403",
    hourly_rate: 10.00,
    introduction: "lorem ipsum dolor"
  )

  service = Service.create([
    { name: "Small" },
    { name: "Medium" },
    { name: "Large" }])

  if service
    1.upto(100) do |a|
      keyword = Keyword.create(keyword: Faker::Superhero.name, service_id: rand(1..Service.all.count))
    end
  end

  if customer.save && tasker.save
    Task.create(tasker_id: rand(1..Tasker.all.count) ,
        customer_id: rand(1..Customer.all.count),
        start_location_address: Faker::Address.street_address,
        end_location_address: Faker::Address.secondary_address,
        approved: rand(0..1),
        task_completed: rand(0..1))
  end
end