=begin

Declare a 2-dimensional array, , of  empty arrays. All arrays are zero indexed.
Declare an integer, , and initialize it to .

There are  types of queries, given as an array of strings for you to parse:

Query: 1 x y
Let .
Append the integer  to .
Query: 2 x y
Let .
Assign the value  to .
Store the new value of  to an answers array.
Note:  is the bitwise XOR operation, which corresponds to the ^ operator in most languages. Learn more about it on Wikipedia.  is the modulo operator.
Finally, size(arr[idx]) is the number of elements in arr[idx]

Function Description

Complete the dynamicArray function below.

dynamicArray has the following parameters:
- int n: the number of empty arrays to initialize in 
- string queries[q]: query strings that contain 3 space-separated integers

Returns

int[]: the results of each type 2 query in the order they are presented
Input Format

The first line contains two space-separated integers, , the size of  to create, and , the number of queries, respectively.
Each of the  subsequent lines contains a query string, .

Constraints

It is guaranteed that query type  will never query an empty array or index.
Sample Input

2 5
1 0 5
1 1 7
1 0 3
2 1 0
2 1 1
Sample Output

7
3
Explanation

Initial Values:


 = [ ]
 = [ ]

Query 0: Append  to .

 = [5]
 = [ ]

Query 1: Append  to .
 = [5]
 = [7]

Query 2: Append  to .

 = [5, 3]
 = [7]

Query 3: Assign the value at index  of  to , print .

 = [5, 3]
 = [7]

7
Query 4: Assign the value at index  of  to , print .

 = [5, 3]
 = [7]

3

=end
#-------------------------------------------------------------
#Ruby program
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def dynamicArray(n, queries)
    # Write your code here
    arr = Array.new(n){[]}
    la = 0
    res = []
    queries.each do |q|
    #    if q[0] == 1
    #         idx =( ( (!q[1].zero?) ^ (!la.zero?) ) ? 1:0 ) % n
    #         arr[idx] << q[2]
    #         #puts "arr[#{idx}] = #{arr[idx]}"
    #    else
    #     idx =( ( (!q[1].zero?) ^ (!la.zero?) ) ? 1:0 ) % n
    #     #puts "idx = #{idx}"
    #     la = arr[idx][ q[2] % arr[idx].length ]
    #     #puts la
    #     res << la
    #    end
       
        if q[0] == 1
            idx = ( q[1] ^ la ) % n
            arr[idx] << q[2]
            #puts "arr[#{idx}] = #{arr[idx]}"
        else
            idx = ( q[1] ^ la ) % n
            #puts "idx = #{idx}"
            la = arr[idx][ q[2] % arr[idx].length ]
            #puts la
            res << la
        end
   
    end
    res

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

queries = Array.new(q)

q.times do |i|
    queries[i] = gets.rstrip.split.map(&:to_i)
end

result = dynamicArray n, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
