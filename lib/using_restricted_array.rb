require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  index = 0
  until array[index] == nil
    index += 1
  end
  return index
end

# Prints each integer values in the array
def print_array(array)
  index = 0
  until array[index] == nil
    return array[index]
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  result = false
  length.times do |index|
    if array[index] == value_to_find
      result = true
    end
    index += 1
  end
  return result
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  max = 0
  length.times do |i|
    if array[i] > max
      max = array[i]
    end
    i += 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  min = array[0]
  length.times do |i|
    if array[i] < min
      min = array[i]
    end
    i += 1
  end
  return min
end

# Reverses the values in the integer array in place
def reverse(array, length)
  a = 0
  b = 1
  if length % 2 == 0
    t = length / 2
  else
    t = (length / 2) + 1
  end
  t.times do |i|
    x = array[a]
    array[a] = array[length - b]
    array[length - b] = x

    a += 1
    b += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  m = ( length / 2 ).to_i
  result = false
  while m > 1
    if array[m] == value_to_find
      return true
    elsif array[m] < value_to_find
      m = ((length - m) / 2).to_i
    else array[m] > value_to_find
      m = (m / 2).to_i
    end
  end
  return result
end



# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
