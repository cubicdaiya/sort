
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
   
   function maximum (self)
      return self.a[1]
   end

   function self.extract_max (self)
      if self.n < 1 then
         error("heap underflow")
      end
      max       = self.a[1]
      self.a[1] = self.a[self.n]
      self.n    = self.n - 1
      self.max_heapify(self.a, 1)
      return max
   end

   function self.increase_key (self, i, key)
      if key < self.a[i] then
         error("new key is lesser than current key")
      end
      
      self.a[i] = key
      while i > 1 and a[self.parent(i)] < self.a[i] do
         self.a[i], self.a[self.parent(i)] = self.a[self.parent(i)], self.a[i]
         i = self.parent(i)
      end
   end

   function self.insert (self, key)
      self.increase_key(self, self.n, key)
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
   
   function self.build_max_heap (self)
      for i=#self.a / 2, 1, -1 do
         self.max_heapify(self, self.a, i)
      end
   end

   function self.sort (self)
      self.build_max_heap(self)
      orig = self.n
      for i=#a, 2, -1  do
         self.a[1], self.a[i] = self.a[i], self.a[1]
         self.n = self.n - 1
         self.max_heapify(self, self.a, 1);
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
