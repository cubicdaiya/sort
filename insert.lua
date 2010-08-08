
require("common")

function insert_sort (arr)
   for i = 2, #arr do
      key = arr[i]
      j = i - 1
      while j > 0 and arr[j] > key do
         arr[j + 1] = arr[j]
         j = j - 1
      end
      arr[j + 1] = key
   end
end

arr = {10,3,38,5,9,11,22,4,98,10,15,18,19,7}

print_result(arr)

insert_sort(arr)

print_result(arr)

is_sorted(arr)
