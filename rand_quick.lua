
require("common")
require("quick")

function rand_partition (a, p, r)
   i = math.random(p, r)
   a[r], a[i] = a[i], a[r]
   return partition(a, p, r)
end

function rand_qsort (a)
   function rand_qsort_inner (q, p, r)
      if p < r then
         q = rand_partition(a, p, r)
         rand_qsort_inner(a, p, q - 1)
         rand_qsort_inner(a, q + 1, r)
      end
   end
   rand_qsort_inner(a, 1, #a)
end

if arg[0] == 'rand_quick.lua' then
   arr = {10,3,38,5,9,11,22,4,98,10,15,18,19,7}
   print_result(arr)
   rand_qsort(arr)
   print_result(arr)
   is_sorted(arr)
end
