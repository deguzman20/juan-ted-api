
service_type_images = [
  Rails.root + 'app/assets/images/service_types/barber.jpg',
  Rails.root + 'app/assets/images/service_types/hair_salon.jpg'
]

service_images = [
  Rails.root + 'app/assets/images/services/haircut.jpeg',
  Rails.root + 'app/assets/images/services/rebond.jpg',
  Rails.root + 'app/assets/images/services/keratin_treatment.jpg',
  Rails.root + 'app/assets/images/services/salon_haircut.jpg',
]

human_images = [
  Rails.root + 'app/assets/images/taskers/harry.jpeg',
  Rails.root + 'app/assets/images/taskers/ron.jpg',
  Rails.root + 'app/assets/images/taskers/hermione.jpeg',
];

@service_type = ServiceType.create([
  { 
    name: "Barber", 
    image:  File.open(service_type_images[0]) 
  },
  { 
    name: "Hair Salon", 
    image: File.open(service_type_images[1]) 
  }
])

@service = Service.create([
  { 
    name: "Haircut", 
    description: "Haircut sample description",
    price: 200.00, 
    image: File.open(service_images[0]),
    service_type_id: 1
  },
  { 
    name: "Rebond", 
    description: "Rebond sample description",
    price: 1500.00, 
    image: File.open(service_images[1]),
    service_type_id: 2
  },
  { 
    name: "Keratin Treatment", 
    description: "Keratin treatment sample description",
    price: 1000.00, 
    image: File.open(service_images[2]),
    service_type_id: 2
  },
  { 
    name: "Haircut", 
    description: "Haircut sample description",
    price: 100.00, 
    image: File.open(service_images[3]),
    service_type_id: 2
  },
])

@what_is_included = WhatIsIncluded.create([
  {
    service_id: 1,
    text: "A mess Free Haircut"
  },
  {
    service_id: 1,
    text: "An all inclusive setup including the equipment and a zero mess cape"
  },
  {
    service_id: 1,
    text: "Customizable Haircut of your choice styled by professionals"
  }
])

@what_is_included = EquipmentUse.create([
  {
    service_id: 1,
    text: "Sanitized Scissors"
  },
  {
    service_id: 1,
    text: "Mirror"
  },
  {
    service_id: 1,
    text: "Hair Sprayer"
  },
  {
    service_id: 1,
    text: "Electric Trimmer"
  },
  {
    service_id: 1,
    text: "Vacuum Cleaner"
  },
  {
    service_id: 1,
    text: "Floor Sheet"
  },
  {
    service_id: 1,
    text: "Disposable Wipes"
  },
  {
    service_id: 1,
    text: "Hair Gel"
  },
  {
    service_id: 1,
    text: "Gloves"
  },
  {
    service_id: 1,
    text: "Masks"
  },
  {
    service_id: 1,
    text: "PPE Kit"
  },
])

@why_this_services = WhyThisService.create([
  {
    service_id: 1,
    reason: "At Home safety ensured as you don't need to step out"
  },
  { 
    service_id: 1,
    reason: "Our barber wear masks & gloves and follow WHO hygiene guidelines"
  },
  { 
    service_id: 1,
    reason: "Scissors, combs, and other equipment is sanitized before and after every use"
  },
  { 
    service_id: 1,
    reason: "We only use disposable sheets, towels, and cape"
  },
  { 
    service_id: 1,
    reason: "Regular temperature checks of pros are done on a daily basis"
  },
  { 
    service_id: 1,
    reason: "Our stylists commute using their own vehicle thereby minimizing contact"
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

  PaymentMethod.create([
    {
      name: "Paypal"
    },
    { 
      name: "Debit"
    }
  ])


  # 1.upto(10) do |b|
  #   tasker_count = Tasker.count
  #   service_type_count = ServiceType.count
  #   customer_count = Customer.count
  #   review = Review.create(rating: rand(1..5), 
  #                   tasker_id: rand(1..tasker_count),
  #                   customer_id: rand(1..customer_count),
  #                   service_type_id: rand(1..service_type_count),
  #                   comment: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4))
  # end

  # 1.upto(5) do |f|
  #   tasker_count = Tasker.count
  #   service_type = ServiceType.count
  #   FeaturedSkill.create(
  #     tasker_id: rand(1..tasker_count),
  #     service_type_id: rand(1..service_type)
  #   )
  # end


end