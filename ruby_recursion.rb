
# Iterate through the array and recurse into nested arrays.
class Array
  def my_recursive_deep_dup
    dups = []
    each do |el|
      el = el.my_deep_dup if el.is_a? Array
      dups << el
    end
    dups
  end
end

# sum a range of numbers
def sum_range(start, finish)
  return 0 if finish < start
  return start if start == finish
  sum = start + sum_range(start.next, finish)
end

# Recursive Fibonacci Sequence
def fibs n
  return [0,1].take(n) if n < 3
  previous_fibs = fibs(n - 1)
  next_fib = previous_fibs[-1] + previous_fibs[-2]
  previous_fibs << next_fib
end

# Binary Search
def bsearch(arr, target)
  return nil if arr.empty?
  middle_idx = arr.length / 2
  middle_value = arr[middle_idx]

  return middle_idx if arr[middle_idx] == target

  if middle_value > target
    bsearch(arr.take(middle_idx),target)
  else
    search = bsearch(arr.drop(middle_idx + 1),target)
    search ? middle_idx + 1 + search : nil
  end
end

# Merge Sort
# recursively reduces an array into single pairs of values
# then orders each pair as the recursion returns using simple
# logic to cut down excessive iterations
def merge_sort(array)
  return array if array.length < 2
  middle_idx = array.length / 2
  first_half = array.take middle_idx
  last_half = array.drop middle_idx

  merge_helper(merge_sort(first_half), merge_sort(last_half))
end

# The actual sorting method
def merge_helper(arr1, arr2)
  merged = []
  until arr1.empty? && arr2.empty?
    if arr1.empty?
      merged << arr2.shift
    elsif arr2.empty?
      merged << arr1.shift
    elsif arr1.first < arr2.first
      merged << arr1.shift
    else
      merged << arr2.shift
    end
  end
  merged
end

# A recursive solution for the traditional makechange problem.
def make_change(coins, target)
  return [] if target == 0
  coins.sort!{|a,b| b <=> a }
  best_change = []

  coins.each do |coin|
    solution = []
    (target / coin).times { solution << coin }

    solution += make_change(coins.drop(1), target % coin)

    if best_change.length > solution.length || best_change.empty?
      best_change = solution
    end
  end
  best_change
end

# adds up an array recursively
def sum_recur(array)
  return array[0] if array.length == 1
  array[0] + sum_recur(array.drop(1))
end

# searches for existance within an array
def includes?(array, target)
  return false if array.empty?
  return true if array[0] == target
  includes?(array.drop(1),target)
end

# determines the number of instances of a target value exist within an array
def num_occur(array, target)
  @base ||= 0
  @base += 1 if array[0] == target
  num_occur(array.drop(1),target) unless array.empty?
  @base
end

# returns true if any pair of numbers in the array sum to tweleve
def add_to_twelve?(array)
  return false if array.length <= 1
  return true if array[0,2].inject(:+) == 12
  add_to_twelve?(array.drop(1))
end

#returns true if the array is sorted
def sorted?(array)
  return true if array.length <= 1
  return false unless array[0] <= array[1]
  sorted?(array.drop(1))
end

# returns a recursively reversed instance of the string by each time
# cutting off the last letter and concats the the results of the recursion
def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse.string[0...-1]
end
