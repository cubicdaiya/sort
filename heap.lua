
function heap_parent(i)
   return math.floor(i / 2)
end

function heap_left(i)
   return 2 * i
end


function heap_right(i)
   return 2 * i + 1
end

function heap_max_heapify (a, n, i)
   l = heap_left(i)
   r = heap_right(i)

   if l <= n and a[l] > a[i] then
      largest = l
   else 
      largest = i
   end

   if r <= n and a[r] > a[largest] then
      largest = r;
   end

   if largest ~= i then
      a[i], a[largest] = a[largest], a[i]
      heap_max_heapify(a, n, largest)
   end

end

function heap_build_max_heap (a)
   for i=#a / 2, 1, -1 do
      heap_max_heapify(a, #a, i)
   end
end

function heap_sort (a)
   heap_build_max_heap(a)
   n = #a
   for i=#a, 2, -1  do
      a[1], a[i] = a[i], a[1]
      n = n - 1
      heap_max_heapify(a, n, 1);
   end
end

a = {4,1,3,2,16,9,10,14,8,7}
heap_sort(a)

for i=1,#a do
   print(a[i])
end
