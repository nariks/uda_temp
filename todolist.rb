class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    def initialize(list_title)
      @title = list_title
      @items = []
    end

    #adds new item to the list.
    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
    end

    def print_list

      report_file = File.new("report.txt","a+")
      report_file.write("\n#{@title}\n")
      report_file.write("===========================================\n")
      @items.each_with_index do |item, index|
        item.status ? checkmark = "[\u2713]" : checkmark = "[X]"
        stuff = sprintf("%-2s %-20s Completed: %s\n", index+1, item.description, checkmark)
        report_file.write(stuff)
      end
    end

    #delete item from list
    def delete_item(item_id)
      if valid_index?(item_id)
        @items.delete_at(item_id-1)
      else
        puts " \nInvalid item id. Delete cancelled"
      end
    end

    def valid_index?(item_id)
      @items.length >= item_id
    end

    def update_status(item_id)
      if valid_index?(item_id)
        @items[item_id-1].status = !@items[item_id-1].status
      else
        puts "Invalid item id. Update cancelled"
      end
    end

    #rename a list
    def update_title(new_title)
      @title = new_title
    end
end

class Item
    # methods and stuff go here
    attr_accessor   :description, :status

    def initialize(item_description)
      @description = item_description
      @status = false
    end

    def print_items
      printf "\n %-20s Completed: %s\n", @description, @status
    end




end
