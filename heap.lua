
require("common")

Heap = {}
function Heap:new (arr)

   local self = {
      a = arr,
      n = #arr
   }

   function self.parent(self, i)
      return math.floor(i / 2)
   end

   function self.left(self, i)
      return 2 * i
   end

   function self.right(self, i)
      return 2 * i + 1
   end

   function self.max_heapify (self, a, i)
      l = self.left(self, i)
      r = self.right(self, i)
      
      if l <= self.n and a[l] > a[i] then
         largest = l
      else 
         largest = i
      end
      
      if r <= self.n and a[r] > a[largest] then
         largest = r;
      end
      
      if largest ~= i then
         a[i], a[largest] = a[largest], a[i]
         self.max_heapify(self, a, largest)
      end
   end
   
   function self.build_max_heap (self, a)
      for i=#a / 2, 1, -1 do
         self.max_heapify(self, a, i)
      end
   end

   function self.sort (self)
      heap:build_max_heap(self.a)
      orig = self.n
      for i=#a, 2, -1  do
         self.a[1], self.a[i] = self.a[i], self.a[1]
         self.n = self.n - 1
         heap:max_heapify(self.a, 1);
      end
      self.n = orig
   end

   return self
end

if arg[0] == 'heap.lua' then
   a = {4,1,3,2,16,9,10,14,8,7}
   heap = Heap:new(a)
   heap:sort()
   print_result(a)
   is_sorted(a)
end
