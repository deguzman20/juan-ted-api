password = 'pass12345'

images = [
  Rails.root + 'app/assets/images/cleaning.jpeg',
  Rails.root + 'app/assets/images/furniture_assembly.jpeg',
  Rails.root + 'app/assets/images/home_repair.jpg',
  Rails.root + 'app/assets/images/mounting.jpg',
  Rails.root + 'app/assets/images/moving-boxes-crosscountry.jpg'
]

@service = Service.create([
  { name: "Cleaning", price: 100.00, image:  File.open(images[0]) },
  { name: "Furniture Assembly", price: 100.00, image: File.open(images[1]) },
  { name: "Home Repair", price: 100.00, image: File.open(images[2]) },
  { name: "Mounting", price: 50.00, image: File.open(images[3]) },
  { name: "Moving", price: 50.00, image: File.open(images[4]) }
])

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

  if @service
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