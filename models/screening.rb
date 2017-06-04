require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :time_id, :capacity


  def initialize(options)
    @id = options['id'].to_i
    @time_id = options['time_id'].to_i
    @capacity = options['capacity'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (time_id, capacity, film_id) VALUES (#{@time_id}, #{@capacity}, #{@film_id}) RETURNING id;"
    screening = SqlRunner.run(sql).first
    @id = screening['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    screenings = SqlRunner.run(sql)
    result = screenings.map { |screening| Screening.new(screening) }
    return result
  end



end