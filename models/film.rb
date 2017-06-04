require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING id;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{price}) WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id=#{id};"
    SqlRunner.run(sql)  
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{id};"
    results = SqlRunner.run(sql)
    punters = results.map {|punter| Customer.new(punter)}
    return punters
  end

  def film_viewings()
    sql = "SELECT customers.name AS customer, films.title AS film, tickets.id AS ticket_id FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id INNER JOIN films ON films.id = tickets.film_id WHERE film_id = #{@id};"
    viewings = SqlRunner.run(sql)
    result = viewings.map{|viewing| PurchaseDetails.new(viewing)}
  end



end