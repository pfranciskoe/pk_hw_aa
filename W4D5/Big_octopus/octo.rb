def slug_octo(arr)
max = ''
    arr.each do |i|
        arr.each do |j|
            max = i if i.length > j.length && i.length > max.length
        end
    end
max
end

def dom_octo(arr)
    arr.sort_by {|ele| ele.length}[-1]
end

def clever_octo(arr)
    max = ''
    arr.each {|ele| max = ele if ele.length > max.length}
    max
end

def slow_dance(key,arr)
    arr.each.with_index do |tile,idx|
        return idx if tile == key 
    end
end
def constant_dance(key,hash)
    hash[key]
end


arr = ['fish', 'fiiish', 'fiiiiish',
 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# puts slug_octo(arr)
# puts dom_octo(arr)
# puts clever_octo(arr)

tiles_array = ["up", "right-up", "right", "right-down", "down",
 "left-down", "left",  "left-up" ]
 tiles_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4,
 "left-down"=>5, "left"=>6,  "left-up"=>7 }

puts slow_dance("up",tiles_array)
puts slow_dance("right-down",tiles_array)

puts constant_dance("up",tiles_hash)
puts constant_dance("right-down",tiles_hash)
