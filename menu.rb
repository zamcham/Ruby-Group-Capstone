class Menu
  # TODO: Need to refactor based on proper methods 
  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    0 => :quit
  }.freeze

  def initialize(app)
    @app = app
  end

  def display
    puts '-------------------'
    puts 'Console App Options'
    puts '-------------------'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '0. Quit'
    puts '-------------------'
    print 'Enter your choice: '
  end

  def process_choice(choice)
    action = OPTIONS[choice]
    if action
      =begin 
        The following line pass in the action as a parameter 
        and calls a method that matched than name 
        on the app class
      =end
      @app.send(action)
    else
      puts 'Invalid choice. Please try again.'
    end
    !choice.zero?
  end
end
