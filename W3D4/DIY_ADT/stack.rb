class Stack
    def initialize
       @pile = []
    end

    def push(el)
      @pile.push(el)
    end

    def pop
        @pile.pop
    end

    def peek
      @pile[-1]
    end

  end

