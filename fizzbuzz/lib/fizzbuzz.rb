class Fizzbuzz
  def says(input)
    return "That's not an integer, bub." unless input.is_a? Fixnum
    output = calculate_fizzbuzz(input)
    output = input if output.empty? 
    output 
  end

  private

  def calculate_fizzbuzz(input)
    output = ""
    output += 'fizz' if input % 3 == 0
    output += 'buzz' if input % 5 == 0
    output 
  end
end
