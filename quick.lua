
require("common")

function partition (a, p, r)
   x = a[r]
   i = p - 1
   for j = p, r - 1  do
      if a[j] <= x then
         i = i + 1
         a[i], a[j] = a[j], a[i]
      end
   end
   a[i + 1], a[r] = a[r], a[i + 1]
   return i + 1
end

function qsort (a)
   function qsort_inner (q, p, r)
      if p < r then
         q = partition(a, p, r)
         qsort_inner(a, p, q - 1)
         qsort_inner(a, q + 1, r)
      end
   end
   qsort_inner(a, 1, #a)
end


if arg[0] == 'quick.lua' then
   arr = {10,3,38,5,9,11,22,4,98,10,15,18,19,7}
   print_result(arr)
   qsort(arr)
   print_result(arr)
   is_sorted(arr)
end
