require 'sinatra'
# require 'sinatra/reloader'

@@SECRET_NUM = rand(101)
@@guesses = 5
message = ''
@status_color = 'none'

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess, @@SECRET_NUM)
  erb :index, locals: { message: message, color: @status_color }
end

# get '/posts' do
#   guess = params['guess']
#   puts "\n\n\n\n\n\n\n #{guess} \n\n\n\n\n\n"
# end


def check_guess(guess, num)
  if @@guesses <= 0
    @@SECRET_NUM = rand(101)
    @@guesses = 5
    'YOU LOST MUAHAH. new num generated.'
  else
    @@guesses -= 1
    if guess - num > 5
      @status_color = 'ochre'
      'Way too high!'
    elsif guess > num
      @status_color = 'pink'
      'Too high!'
    elsif num - guess > 5
      @status_color = 'ochre'
      'Way too low!'
    elsif guess < num
      @status_color = 'pink'
      'Too low!'
    else
      @status_color = 'green'
      @@SECRET_NUM = rand(101)
      @@guesses = 5
      "You got it right! The secret number is #{num}"
    end
  end
end
