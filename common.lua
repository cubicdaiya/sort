
function round(num) 
   return math.floor(num+.5)
end

function swap (a, b)
   
end

function print_result(arr)
   for i, v in pairs(arr) do
      io.write(v .. " ")
   end
   print()
end

function is_sorted(arr)
   for i=2, #arr do
      if arr[i-1] > arr[i] then
         print("not sorted")
         return
      end
   end
   print("sorted")
end
