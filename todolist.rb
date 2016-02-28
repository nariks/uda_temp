class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    #initialize and name the list
    def initialize(list_title)
      @title = list_title
      @items = []
      @file_name = @title + '.txt'                              #keeps track of file name
    end

    #adds new item to the list
    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
      update_list_file
    end

    #delete item from list
    def delete_item(item_id)
      if valid_index?(item_id)                                  #checks if delete index is valid
        @items.delete_at(item_id-1)
        update_list_file
      else
        puts " \nInvalid item id. Delete cancelled"
      end
    end

    #updates item status
    def update_status(item_id)
      if valid_index?(item_id)                                  #checks if index is valid
        @items[item_id-1].update_status
        update_list_file
      else
        puts "Invalid item id. Update cancelled"
      end
    end

    #rename the title of the list
    def update_list_title(new_title)
      title_old = @title
      @title = new_title
      @file_name = new_title + '.txt'


      #update list name in the file
      File.rename(title_old + '.txt', @file_name)               #change file name to new list name
      data = File.read(@file_name)
      new_data = data.gsub(title_old,@title)                    #replace old list title with new title
      File.open(@file_name, "w") do |f|
        f.write(new_data)
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

    #updates list text file contents
    def update_list_file
      report_file = File.new(@file_name,"w+")
      report_file.write("\n#{@title}\n======================================\n")
      @items.each_with_index do |item, index|
        #convert the completion status from boolean into tickmark  or cross
        status = item.status ? "[\u2713]" : "[X]"
        report_file.write(item.print_item(index, status))
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

    def update_status
    	@status = !@status
    end

    def print_item(index, status)
      sprintf("%-2s %-20s Completed: %s\n", index, @description, status)
    end
end
