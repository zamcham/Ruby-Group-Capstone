require_relative 'app'

class Main
  def initialize
    @app = App.new(self)
    loop do
      show_console_options
      option = get_user_input('Enter your choice: ').to_i
      break if option == 10
      select_option(option)
    end
  end

  def display_menu
    @app.display_menu
  end

  def show_console_options
    options_array = ['List All Books', 'List All Music Albums', 'List All Games', 'List All Genres',
                     'List All Labels', 'List All Authors', 'Add Book', 'Add a Music Album', 'Add a Game', 'Exit']
    puts "\nWelcome to the Ruby Console App!"
    puts "\nPlease choose an option from the list below:"
    puts '-------------------------------------------'
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end

  def select_option(option)
    case option
    when 1..7
      puts "Method #{option}"
      sleep(1)
    when 8
      @app.add_music_album
    else
      puts '-------------------------------------------'
      puts "\nInvalid option, try again!"
      puts "\n-------------------------------------------"
    end
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end

Main.new
