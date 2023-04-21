declare -A my_dict
my_dict["a"]=5
my_dict["b"]=10
my_dict["c"]=15

# Add two values in the dictionary
sum=$(( my_dict["a"] + my_dict["a"] ))
echo "The sum of a and b is: $sum"

# Subtract one value from another in the dictionary
diff=$(( my_dict["a"] - my_dict["b"] ))
echo $diff
echo "The difference between c and a is: $diff"