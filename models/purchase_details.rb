require_relative('../db/sql_runner')

class PurchaseDetails

  attr_reader :customer_name, :film_title, :ticket_id, :ticket_price, :screening_time

  def initialize(options)
    @customer_name = options['customer']
    @film_title = options['film_title']
    @ticket_id = options['ticket_id'].to_i
    @ticket_price = options['ticket_price'].to_i
    @screening_time = options['screening_time'].to_i
  end

  def self.all()
    sql = "SELECT customers.name AS customer, films.title AS film_title, tickets.id AS ticket_id, films.price AS ticket_price, screenings.time_id AS screening_time FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id INNER JOIN films ON films.id = tickets.film_id INNER JOIN screenings ON screenings.film_id = tickets.film_id;"
    details = SqlRunner.run(sql)
    return details.map {|purchase| PurchaseDetails.new(purchase)}
  end


end
