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
    if block_given?
      is_all = true

      my_each { |i| is_all = false if yield(i) == false}

      is_all
    else
      self
    end
  end

  def my_any?
    if block_given?
      is_any = false
      my_each { |i| is_any = true if yield(i) } #shorthand for condition true
      is_any
    else
      self
    end
  end

  def my_none?

    if block_given?
      is_none = true
      my_each { |i| is_none = false if yield(i) }
      is_none
    else
      self
    end
  end

  def my_count
    if block_given?
      count = 0
      my_each { |i| count += 1 if yield(i) }
      count
    else
      self.length
    end
  end

  def my_map
    if block_given?
      mapped_array = []
      my_each { |i| mapped_array << yield(i)}
      mapped_array
    else
      self
    end

  end

  def my_inject(initial=0)
    if block_given?
      injected = initial
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
