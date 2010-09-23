
require("common")

function max_elem (a)
   max = a[1]
   for i, e in pairs(a) do
      if e > max then
         max = e
      end
   end
   return max
end

function cnt_sort (a, b, k)
   c = {}
   for i = 0, k do
      c[i] = 0
   end
   
   for j = 1, #a do
      c[a[j]] = c[a[j]] + 1
   end
   
   for i = 1, k  do
      c[i] = c[i] + c[i - 1]
   end
   
   for j = #a, 1, -1 do
      b[c[a[j]]] = a[j]
      c[a[j]] = c[a[j]] - 1
   end
end

a = {10,3,38,5,9,11,22,4,98,10,15,18,19,7}
b = {}
print_result(a)
cnt_sort(a, b, max_elem(a))
print_result(b)
is_sorted(b)

