
service_type_images = [
  Rails.root + 'app/assets/images/service_types/cleaning.jpeg',
  Rails.root + 'app/assets/images/service_types/home_repair.jpg',
  Rails.root + 'app/assets/images/service_types/laundry.jpg',
  Rails.root + 'app/assets/images/service_types/nail_care.jpg'
]

service_images = [
  Rails.root + 'app/assets/images/services/manicure.png',
  Rails.root + 'app/assets/images/services/pedicure.png'
]

human_images = [
  Rails.root + 'app/assets/images/taskers/harry.jpeg',
  Rails.root + 'app/assets/images/taskers/ron.jpg',
  Rails.root + 'app/assets/images/taskers/hermione.jpeg',
];

@service_type = ServiceType.create([
  { 
    name: "Cleaning", 
    image:  File.open(service_type_images[0]) 
  },
  { 
    name: "Home Repair", 
    image: File.open(service_type_images[1]) 
  },
  { 
    name: "Laundry", 
    image: File.open(service_type_images[2]) 
  },
  { 
    name: "Nail Care", 
    image: File.open(service_type_images[3]) 
  }
])

@service = Service.create([
  { 
    name: "Manicure", 
    description: "Manicure sample description",
    price: 200.00, 
    image: File.open(service_images[0]),
    service_type_id: 4
  },
  { 
    name: "Pedicure", 
    description: "Pedicure sample description",
    price: 150.00, 
    image: File.open(service_images[1]),
    service_type_id: 4
  },
  { 
    name: "0-4 Kilos", 
    price: 150.00, 
    service_type_id: 3
  },
  { 
    name: "5-8 Kilos", 
    price: 200.00, 
    service_type_id: 3
  },
  { 
    name: "9-12 Kilos", 
    price: 350.00, 
    service_type_id: 3
  }
])

@password = 'pass12345'

1.upto(5) do |i|
  customer = Customer.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: File.open(human_images[rand(0..2)]),
    email: "customer-#{i}@example.com",
    password: @password,
    password_confirmation: @password,
    mobile_number: "09495939582",
    zip_code: "1403",
    card_detail: "9127381273",
  )

  tasker = Tasker.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: File.open(human_images[rand(0..2)]),
    email: "tasker-#{i}@example.com",
    password: @password,
    password_confirmation: @password,
    mobile_number: "09495939582",
    zip_code: "1403",
    hourly_rate: 10.00,
    introduction: Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4),
    lng: 121.005239,
    lat: 14.6649003,
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

  1.upto(10) do |b|
    tasker_count = Tasker.count
    service_type_count = ServiceType.count
    customer_count = Customer.count
    review = Review.create(rating: rand(1..5), 
                    tasker_id: rand(1..tasker_count),
                    customer_id: rand(1..customer_count),
                    service_type_id: rand(1..service_type_count),
                    comment: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4))
  end


end