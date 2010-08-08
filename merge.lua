 
require("common")

function merge (arr, p, q, r)
   local n1 = q - p + 1
   local n2 = r - q
   local L, R = {}, {}

   for i = 1, n1 do
      L[i] = arr[p + i - 1]
   end

   for i = 1, n2 do
      R[i] = arr[q + i]
   end

   local i, j = 1, 1

   for k = p, r do
      if i > #L then
         arr[k] = R[j]
         for l=k+1, r do
            arr[l] = R[j]
            j = j + 1
         end
         return
      elseif j > #R then
         arr[k] = L[i]
         for l=k+1, r do
            arr[l] = L[i]
            i = i + 1
         end
         return
      end
      if L[i] <= R[j] then
         arr[k] = L[i]
         i = i + 1
      else
         arr[k] = R[j]
         j = j + 1
      end
   end
end

function merge_sort (arr)
   local function merge_sort_inner (arr, p, r)
      if p < r then
         local q = math.floor((p + r) / 2)
         merge_sort_inner(arr, p, q)
         merge_sort_inner(arr, q + 1, r)
         merge(arr, p, q, r)
         return
      end
   end
   merge_sort_inner(arr, 1, #arr)
end

arr = {10,3,38,5,9,11,22,4,98,10,15,18,19,7}

print_result(arr)

merge_sort(arr)

print_result(arr)

is_sorted(arr)
