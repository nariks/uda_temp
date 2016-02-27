require_relative 'todolist.rb'

# Creates a new todo list
todo = TodoList.new("To learn Ruby")

# Add four new items
todo.add_item("Learn arrays")
todo.add_item("Learn classes")
todo.add_item("Learn loops")
todo.add_item("Learn Git")

# Print the list
todo.print_list

# Delete the first item
todo.delete_item(10)

# Print the list
todo.print_list

# Delete the second item
todo.delete_item(2)

# Print the list
todo.print_list

# Update the completion status of the first item to complete
todo.update_status(2)

# Print the list
todo.print_list

# Update the title of the list
todo.update_list_title("Things to learn in Ruby")
# Print the list
todo.print_list

item = Item.new("Whatsapp")
item.print_item
