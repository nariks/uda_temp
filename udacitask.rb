require_relative 'todolist.rb'

# Creates a new todo list
todo = TodoList.new("Ruby List")

# Add four new items
todo.add_item("Learn arrays")
todo.add_item("Learn classes")
todo.add_item("Learn loops")
todo.add_item("Learn Git")

# Print the list
todo.print_list

# Delete the first item
todo.delete_item(1)

# Print the list
todo.print_list

# Delete the second item
todo.delete_item(2)

# Print the list
todo.print_list

# Update the completion status of the first item to complete
todo.update_status(1)

# Print the list
todo.print_list

# Update the title of the list
todo.update_list_title("Things to learn in Ruby")

# Print the list
todo.print_list
