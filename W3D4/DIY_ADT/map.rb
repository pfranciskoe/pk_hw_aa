class Map
    def initialize
    @map_arr = []
    end
    def set(key,value)
        if @map_arr.none?{|ele| ele[0] == key}
            @map_arr << [key,value]
        else
            @map_arr.map do |ele|
                if ele[0] == key
                [key,value]
                else
                ele
                end
            end
        end
    end

    def get(key)
        @map_arr.each {|ele| return ele if ele[0] == key}
    end

    def delete(key)
        @map_arr.each.with_index do |ele,idx|
            if ele[0] == key
                @map_arr.delete_at(idx)
                return
            end
        end
    end
    
    def show
        @map_arr
    end


end