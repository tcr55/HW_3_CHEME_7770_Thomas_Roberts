#Primary Run file for HW3
#Will retun Part a, Part b, and Part c
#Part a asks for the Stoiciometric matrix and is labeld as stoichiometric_matrix in this file generated from HW_3_Data.jl
#Part b asks for the elemenatl balance check, done using an atom matrix in Atom_array.jl,
#Check_balance_Test Returns True if the reactions are balanced and false if not.
#Part c asks for the optimal Urea production rate given as objective_value, renamed to Optimal_Urea_Production for easy identification


#using the FBA solver from the Varner lab from github
include("calculate_optimal_flux_distribution.jl");
#grabbing the data and stoichiometric_matrix generated in HW_3_Data
include("HW_3_Data.jl");

#grabbing the Atom array generated to use for checking elemental balances, includes the syntax for checking for elemental balance
include("Atom_array.jl");

# set objective to maximize production of Urea
objective_coefficient_array[10] = 1.0;


(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag) = calculate_optimal_flux_distribution(stoichiometric_matrix, default_bounds_array, species_bounds_array, objective_coefficient_array; min_flag = false);
#redefince objective value to identify its purpose
Optimal_Urea_Production_Flux = objective_value;

#Print the important results for part a,b,c
println("Part A:")
display(stoichiometric_matrix);
println("");
println("Part B:   ", Check_balance_Test);
println("");
println("Part C:   The Urea Productin Flux is ", Optimal_Urea_Production_Flux, "   mmol/gDw-hr    " );
