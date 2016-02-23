class TodoList
    # methods and stuff go here
    attr_accessor  :title, :items

    def initialize(list_title)
      @title = list_title
      @items = []
    end

    def add_item(item)
      @items.push(item)
    end

    def print_list
      @items.each {|item| puts item}
    end

    def delete_item(item_id)
      @items.delete_at(item_id-1)

end

class Item
    # methods and stuff go here
    attr_accessor   :description, :status

    def initialize(item_description)
      @description = description
      @status = false
    end

end
