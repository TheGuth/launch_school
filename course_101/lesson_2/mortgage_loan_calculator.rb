# mortgage_loan_calculator

def prompt(message)
  puts "=> #{message}"
end
# provides a => infront of messages that will be printed to the users screen.

def valid_number?(num)
  num.to_i.to_s == num
end
# checks whether a number entered is actually a number

def valid_float_number?(num)
  num.to_f.to_s == num
end
# checks whether a number is a float or not
loop do
# checks if something is entered for the name
  name = ''
  loop do
    prompt("Hello, What is your name?")
    name = gets.chomp
    if name.empty?
      prompt("Make sure to use a valid name.")
    else
      break
    end
  end

  prompt("Hi #{name}")
  prompt("Welcome to your mortgage calculator!!!")

  loan_amount = ''
  loop do
    prompt("Please enter the loan amount being requested.")
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt("please enter a valid number")
    end
  end

  prompt("I see you will be wanting a loan for $#{loan_amount} how exciting!")

  annual_percentage_rate = ''
  loop do
    prompt("Please enter the Annual Percentage Rate (APR).")
    prompt("Add your percent in decimal form. You do not need a % sign")
    prompt("An example would be 5.0 for 5%")
    annual_percentage_rate = gets.chomp

    if valid_float_number?(annual_percentage_rate)
      break
    else
      prompt("please enter a valid pecentage")
    end
  end

  prompt("Your #{annual_percentage_rate} APR looks good")

  loan_duration_years = ''
  loop do
    prompt("Please enter in how long this loan will be for?")
    prompt("Your input should be in years")
    # prompt("If your loan will be less than 1 year input 0")
    loan_duration_years = gets.chomp

    if valid_number?(loan_duration_years)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  prompt("_________________________________________________________________")
  prompt("Please wait as we calculate your monthly interest rate.")

  annual_rate = annual_percentage_rate.to_f / 100
  months = loan_duration_years.to_i * 12
  monthly_rate = annual_rate / 12

  fixed_monthly_payment = loan_amount.to_f *
                          (monthly_rate /
                          (1 - (1 + monthly_rate)**-months.to_i()))

  fixed_monthly_payment = fixed_monthly_payment.to_f.round(2)

  prompt("This is what your current monthly interest rate would be #{monthly_rate}")
  prompt("your loan would be for #{months} months")
  puts "_____________________________________________________________________"
  prompt("Now then lets calculate your Monthly Payment and Loan Balance")
  prompt("It looks like you will have a Monthly Payment of $#{fixed_monthly_payment}")
  puts "_____________________________________________________________________"
  prompt("Congradulations!")
  prompt("So altogether it looks like you will be taking out a loan at $#{loan_amount}")
  prompt("for #{loan_duration_years} years or #{months} months")
  prompt("at a monthly rate of #{monthly_rate}")
  prompt("while only having to pay $#{fixed_monthly_payment} a month")

  prompt("Would you like to do another calculation?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you! You are welcome back anytime.")
