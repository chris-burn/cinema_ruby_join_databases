require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require_relative('../models/screening')
require_relative('../models/purchase_details')

require ('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Danielle Burn',
  'funds' => 60,
  'purchases_value' => 0
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Jack Burn',
  'funds' => 50,
  'purchases_value' => 0
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Jimmy Buchan',
  'funds' => 35,
  'purchases_value' => 0
  })
customer3.save()



film1 = Film.new({
  'title' => 'Kung-Fu Panda 10 - Old Panda Lives On',
  'price' => 20
  })
film1.save()

film2 = Film.new({
  'title' => 'Killer Haddock 2',
  'price' => 30
  })
film2.save()

film3 = Film.new({
  'title' => 'CodeClan Dreams',
  'price' => 25
  })
film3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })
ticket4.save()


screening1 = Screening.new({
  'time_id' => 1500,
  'capacity' => 100,
  'film_id' => film1.id
  })
screening1.save()

screening2 = Screening.new({
  'time_id' => 1900,
  'capacity' => 200,
  'film_id' => film2.id
  })
screening2.save()

screening3 = Screening.new({
  'time_id' => 2000,
  'capacity' => 250,
  'film_id' => film3.id
  })
screening3.save()


binding.pry
nil





