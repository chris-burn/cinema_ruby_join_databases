require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds, :purchases_value

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
    @purchases_value = options['purchases_value'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds, purchases_value) VALUES ('#{@name}', #{@funds}, #{@purchases_value}) RETURNING id;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * from customers;"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

  def update()
    sql = "UPDATE customers SET (name, funds, purchases_value) = ('#{@name}', #{@funds}, #{@purchases_value}) WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{id};"
    results = SqlRunner.run(sql)
    flicks = results.map { |flick| Film.new(flick)}
    return flicks
  end


  def purchases() 
    sql = "SELECT customers.name AS customer, films.title AS film_title, tickets.id AS ticket_id, films.price AS ticket_price FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id INNER JOIN films ON films.id = tickets.film_id WHERE customer_id = #{@id};"
    details = SqlRunner.run(sql)
    return details.map {|purchase| PurchaseDetails.new(purchase)}
  end

  def purchases_value #????
    sql = "SELECT customers.name AS customer, films.title AS film_title, tickets.id AS ticket_id, films.price AS ticket_price FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id INNER JOIN films ON films.id = tickets.film_id WHERE customer_id = #{@id};"
    details = SqlRunner.run(sql)
    return details.map {|purchase| purchase['ticket_price']} 
  end

  def update_funds() #???
    sql = "UPDATE customers SET (funds) = (#{funds} - #{purchases_value}) WHERE id = #{id};"
    SqlRunner.run(sql)
  end


end


