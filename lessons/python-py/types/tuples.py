# A tuple is a collection of objects which ordered and immutable. Tuples are sequences, just like lists. The differences between tuples and lists are, the
#  tuples cannot be changed unlike lists and tuples use parentheses, whereas lists use square brackets.

# Creating a tuple is as simple as putting different comma-separated values. Optionally you can put these comma-separated 
# values between parentheses also. For example −

tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5 );
tup3 = "a", "b", "c", "d";


#Tuples
foods_tup = ("potato", "carot", "onion", "bread", "grape", "melon")
#foods_tup.insert(1,"ak")  cannot change Tuples
print(foods_tup)


Accessing Values in Tuples
To access values in tuple, use the square brackets for slicing along with the index or indices to obtain value available at that 
index. For example −

Live Demo
#!/usr/bin/python

tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5, 6, 7 );
print "tup1[0]: ", tup1[0];
print "tup2[1:5]: ", tup2[1:5];
When the above code is executed, it produces the following result −

tup1[0]:  physics
tup2[1:5]:  [2, 3, 4, 5]
Updating Tuples
Tuples are immutable which means you cannot update or change the values of tuple elements. You are able to take portions of existing tuples to create new tuples as the following example demonstrates −

Live Demo
#!/usr/bin/python

tup1 = (12, 34.56);
tup2 = ('abc', 'xyz');

# Following action is not valid for tuples
# tup1[0] = 100;

# So let's create a new tuple as follows
tup3 = tup1 + tup2;
print tup3;
When the above code is executed, it produces the following result −

(12, 34.56, 'abc', 'xyz')
Delete Tuple Elements
Removing individual tuple elements is not possible. There is, of course, nothing wrong with putting together another tuple with the undesired elements discarded.

To explicitly remove an entire tuple, just use the del statement. For example −

Live Demo
#!/usr/bin/python

tup = ('physics', 'chemistry', 1997, 2000);
print tup;
del tup;
print "After deleting tup : ";
print tup;
This produces the following result. Note an exception raised, this is because after del tup tuple does not exist any more −

('physics', 'chemistry', 1997, 2000)
After deleting tup :
Traceback (most recent call last):
   File "test.py", line 9, in <module>
      print tup;
NameError: name 'tup' is not defined