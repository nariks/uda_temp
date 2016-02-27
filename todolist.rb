class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    #initializing and naming the list
    def initialize(list_title)
      @title = list_title
      @items = []
    end

    #rename a list
    def update_list_title(new_title)
      @title = new_title
    end

    #adds new item to the list.
    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
      add_list_file(item)
    end

    #delete item from list
    def delete_item(item_id)
      if valid_index?(item_id)
        @items.delete_at(item_id-1)
        puts @items
        delete_list_file
      else
        puts " \nInvalid item id. Delete cancelled"
      end
    end

    #updates item status
    def update_status(item_id)
      if valid_index?(item_id)
        @items[item_id-1].status = !@items[item_id-1].status
      else
        puts "Invalid item id. Update cancelled"
      end
    end

    def print_list
        # report_file = File.new("report.txt","a+")
        # report_file.write("\n#{@title}\n")
        # report_file.write("===========================================\n")
        # @items.each_with_index do |item, index|
        #   item.status ? checkmark = "[\u2713]" : checkmark = "[X]"
        #   stuff = sprintf("%-2s %-20s Completed: %s\n", index+1, item.description, checkmark)
        #   report_file.write(stuff)
        # end
    end

    def valid_index?(item_id)
      @items.length >= item_id
    end

    def add_list_file(item)
      file_name = @title + '.txt'
      if @items.length == 1
        report_file = File.new(file_name,"w+")
        report_file.write("\n#{@title}\n")
        report_file.write("===========================================\n")
      else
        report_file = File.open(file_name, "a+")
      end
      item_detail = sprintf("%-2s %-20s Completed: %s\n", @items.length, item.description, "[X]")
      report_file.write(item_detail)
    end

    def delete_list_file
      file_name = @title + '.txt'
      report_file = File.new(file_name,"w+")
      report_file.write("\n#{@title}\n")
      report_file.write("===========================================\n")
      @items.each_with_index do |item, index|
        item_detail = sprintf("%-2s %-20s Completed: %s\n", index+1, item.description, "[X]")
        report_file.write(item_detail)
      end
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
