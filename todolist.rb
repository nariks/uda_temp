class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    #initialize and name the list
    def initialize(list_title)
      @title = list_title
      @items = []
      @file_name = @title + '.txt'                              #keeps track of file name 
    end

    #rename the title of the list
    def update_list_title(new_title)
      File.rename(@file_name, new_title + '.txt')               #change file name to new list name
      @title = new_title
    end

    #adds new item to the list.
    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
      update_todolist_file('add', item)                         #adds new item to text file
    end

    #delete item from list
    def delete_item(item_id)
      if valid_index?(item_id)                                  #checks if delete index is valid
        @items.delete_at(item_id-1)
        update_list_file('delete', nil)                         #writes updated list to file
      else
        puts " \nInvalid item id. Delete cancelled"
      end
    end

    #updates item status
    def update_status(item_id)
      if valid_index?(item_id)                                  #checks if index is valid
        @items[item_id-1].status = !@items[item_id-1].status
        update_list_file('update', nil)                         #writes updated list to file
      else
        puts "Invalid item id. Update cancelled"
      end
    end

    #print the contents of the list from the list file after checking if it exists
    def print_list
        if File.file?(@file_name)                               
          report_file = File.open(@file_name,"r")               
          report_file.each_line do |line|
            puts line.force_encoding('utf-8') 
          end
          report_file.close
        else
          puts ("No such list file exists")
        end
      end

    # to check if the item_id exists in the list and returns a boolean 
    def valid_index?(item_id)
      @items.length >= item_id
    end

    #Writes added item to EOF or re-writes list after delete operation
    #if adding first item or performaing a delete or update status operation, rewrite list file 
    #else append new list item to the end
    def update_todolist_file(operation, item)
      if @items.length == 1 || operation == 'delete' || operation == 'update'
        report_file = File.new(@file_name,"w+")
        report_file.write("\n#{@title}\n")
        report_file.write("===========================================\n")
        @items.each_with_index do |item, index|
          #convert the completion status from boolean into tickmark  or cross
          status = item.status ? " \u2713" : "[X]"   
          item_detail = sprintf("%-2s %-20s Completed: %s\n", index+1, item.description, status)
          report_file.write(item_detail)
        end
      else
        report_file = File.open(@file_name, "a+")
        item_detail = sprintf("%-2s %-20s Completed: %s\n", @items.length, item.description, "[X]")
        report_file.write(item_detail)
      end
      report_file.close
    end
end

class Item
    # methods and stuff go here
    attr_accessor   :description, :status

    def initialize(item_description)
      @description = item_description
      @status = false
    end

    def print_item
      printf "\n %-20s Completed: %s\n", @description, @status
    end
end
