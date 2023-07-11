require_relative 'app/app'
require_relative 'app/menu/menu'

# Main class is used to start the app.
class Main
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def display_menu
    @app.display_menu
  end

  def run
    # TODO: implement later ↓
    # @app.load_data_from_files
    loop do
      @menu.display
      choice = gets.chomp.to_i

      break unless @menu.process_choice(choice)
    end
  end
end

Main.new.run
