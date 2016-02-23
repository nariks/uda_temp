class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    def initialize(list_title)
      @title = list_title
      @items = []
    end

    def add_item(new_item)
      item = Item.new(new_item)
      @items.push(item)
    end

    def print_list
      puts "\n#{@title}"
      puts "==========================================="
      @items.each_with_index do |item, index|
        printf "%-2s %-20s Completed: %s\n", index+1, item.description, item.status
      end
    end

    def delete_item(item_id)
      @items.delete_at(item_id-1)
    end

    def update_status(item_id)
      @items[item_id-1].status = !@items[item_id-1].status
    end

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


end
