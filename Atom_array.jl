#Atom Array for Elemntal balance checking

#grab the stoichiometric_matrix from the HW_3_Data file
include("HW_3_Data.jl");

#Atom matrix
#C
#H
#N
#O
#P
#S     *no sulfur in the system so this row is excluded*


  A = [ 1  0  6  0  21 0  4  10 10 10 4  6  21 0  0  1  5  0
        4  3  13 0  29 2  7  16 14 18 4  14 30 1  0  4  12 4
        1  0  3  1  7  0  1  5  5  4  0  4  7  0  0  2  2  0
        5  4  3  1  17 1  4  13 7  6  4  2  17 0  2  1  2  7
        1  1  0  0  3  0  0  3  1  0  0  0  3  0  0  0  0  2 ];

A = convert(Array{Float64}, A);


#Rename the Stoiciometric matrix array for elemental check
stoichiometric_matrix = S;

# generate a balance array following the Atom matrix method
balance_array = A*S;

# Grab only the raction fluxes v, which is in all rows but only the first 6 columns
v_balance_array = balance_array[1:5,1:6];

#check that the reactions are now elementally balanced
array_check_balance = sum(v_balance_array,dims=2);
balance_value = sum(array_check_balance,dims=1);
if balance_value[1,1] == 0 ;
    Check_balance_Test = "TRUE, Reaction is elementally balanced"
else
    Check_balance_Test = "FALSE, Reaction is not elementally balanced, check balance array"
end
