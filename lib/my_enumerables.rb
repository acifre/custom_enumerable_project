module Enumerable
  # Your code goes here
  def my_each

    if block_given?
      i = 0
      until i == self.length do
        yield(self[i])
        i += 1
      end
    end
    self

  end

  def my_each_with_index

    if block_given?
      i = 0
      until i == self.length do
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    if block_given?
      selected_array = []
      my_each { |i| selected_array << i if yield(i) }
      selected_array

    else
      self
    end

  end

  def my_all?
    is_all = false
    if block_given?
      count = 0
      i = 0
      until i == self.length do
        count += 1 if yield (self[i])
        i += 1
      end

      is_all = true if count == self.length
      is_all
    else
      self
    end
  end

  def my_any?
    is_any = false
    if block_given?
      count = 0
      i = 0
      until i == self.length do
        count += 1 if yield (self[i])
        i += 1
      end

      is_any = true if count > 0
      is_any
    else
      self
    end
  end

  def my_none?
    none = false
    if block_given?
      count = 0
      i = 0
      until i == self.length do
        count += 1 if yield (self[i])
        i += 1
      end

      none = true if count == 0
      none
    else
      self
    end
  end

  def my_count
    if block_given?
      count = 0
      i = 0
      until i == self.length do
        count += 1 if yield(self[i])
        i += 1
      end
      count
    else
      self.length
    end
  end

  def my_map
    if block_given?
      mapped_array = []
      i = 0
      until i == self.length do
        mapped_array << yield(self[i])
        i += 1
      end
      mapped_array
    else
      self
    end

  end

  def my_inject(initial=0)

    injected = initial
    if block_given?
      i = 0
      until i == self.length do
        injected = yield(injected, self[i])
        i += 1
      end
      injected
    else
      self
    end

  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each

    if block_given?
      i = 0
      until i == self.length do
        yield(self[i])
        i += 1
      end
    end
    self

  end
end
