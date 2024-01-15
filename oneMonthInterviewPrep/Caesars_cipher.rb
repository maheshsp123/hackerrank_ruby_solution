=begin
Julius Caesar protected his confidential information by encrypting it using a cipher. Caesar's cipher shifts each letter by a number of letters. If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet. In the case of a rotation by 3, w, x, y and z would map to z, a, b and c.

Original alphabet:      abcdefghijklmnopqrstuvwxyz
Alphabet rotated +3:    defghijklmnopqrstuvwxyzabc
Example


The alphabet is rotated by , matching the mapping above. The encrypted string is .

Note: The cipher only encrypts letters; symbols, such as -, remain unencrypted.

Function Description

Complete the caesarCipher function in the editor below.

caesarCipher has the following parameter(s):

string s: cleartext
int k: the alphabet rotation factor
Returns

string: the encrypted string
Input Format

The first line contains the integer, , the length of the unencrypted string.
The second line contains the unencrypted string, .
The third line contains , the number of letters to rotate the alphabet by.

Constraints



 is a valid ASCII string without any spaces.

Sample Input

11
middle-Outz
2
Sample Output

okffng-Qwvb
Explanation

Original alphabet:      abcdefghijklmnopqrstuvwxyz
Alphabet rotated +2:    cdefghijklmnopqrstuvwxyzab

m -> o
i -> k
d -> f
d -> f
l -> n
e -> g
-    -
O -> Q
u -> w
t -> v
z -> b

=end

#------------------------------------------------
#Ruby program
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'caesarCipher' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s
#  2. INTEGER k
#

def caesarCipher(s, k)
    # Write your code here
    # A_num = "A".ord
    # Z_num = "Z".ord
    # a_num = "a".ord 
    # z_num = "z".ord
    
    (0..s.length-1).each do |i|
       
        if toC(s[i]) >= toC("A") and toC(s[i]) <= toC("Z")
            n = (toC(s[i]) - toC("A") + k) % 26
            s[i] = (toC("A") + n).chr
        end
       
        if toC(s[i]) >= toC("a") and toC(s[i]) <= toC("z")
            n = (toC(s[i]) - toC("a") + k) % 26
            s[i] = (toC("a") + n).chr
        end
    end
    
    return s

end

def toC c
    c.ord
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

s = gets.chomp

k = gets.strip.to_i

result = caesarCipher s, k

fptr.write result
fptr.write "\n"

fptr.close()
