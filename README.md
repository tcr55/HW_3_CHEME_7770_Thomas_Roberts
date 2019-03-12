# HW_3_CHEME_7770_Thomas_Roberts
Homework for Chem E 7770 Homework number 3 due 3/12/19 at 11:59 pm

Files Included: 
 -------------------------------------------------------------------------------------------------------------------------  
 
  -------------------------------------------------------------------------------------------------------------------------  
  
---Julia---
 -------------------------------------------------------------------------------------------------------------------------  
- Run.jl                                 : Primary run file

- Atom_array.jl                          : File to generate Atom array and Check elemental balance for part b

- HW_3_Data.jl                           : Data file that holds the Stoiciometric Matrix, Constants and Kinetic data from literature, etc
                                         also calualtes the v_max for all reactions and creates the bounds array for the FBA
                                         
- calculate_optimal_flux_distribution    : Varner lab FBA code which takes the Stociometric matrix, bounds array, species bounds array
                                         objective function array, and min or max arguemnt to perform FBA and return the objective value
                                         objective value is the optimal urea flux for part c

Have all downloaded before attempting to run the Run.jl file

 -------------------------------------------------------------------------------------------------------------------------  
 

---PDF---
 -------------------------------------------------------------------------------------------------------------------------  
 
- HW_3_word_supplemental_info  : file that gives a diagram of the reaction scheme with added sources and sinks, and a list of the reactions both in name and in elemental form. reactions were using KEGG pathway data
- Diagram_HW3_Bio  : just the Diagaram of the reaction network, redundant and also availabe in the supplemental file

- Written_Response : file that has the written response to the questions and easy view of the answers
 -------------------------------------------------------------------------------------------------------------------------  
 
 Location of answers
 ----
 - The stoiciometric matrix is in the HW_3_Data.jl file, will become stored in the workspace after running Run.jl, and will be printed and labeled as Part A.
 - Part b, is done by an Atom Matrix, a by hand written out section is provided in supplemental, the array array_check_balance in the workspace after running provides the Atom check for elemental balance
 - Part c requires the code and the code will store the optimal urea production rate in two places: one is calling it objective_value and is renamed to urea productin flux and is stored in the workspace. And Two is printed after running Run.jl
 - for convinenece a snipping tool screenshot of a functional code printout is provided in the written response file
 --------------------------------------------------------------------------------------------------------------------------
 
 
Specific Instructions / Code operation
 -------------------------------------------------------------------------------------------------------------------------  
The calculate_optimal_flux_distribution requires the arrays metioned above, so HW_3_Data needs to be downloaded first.
 
Run.jl will perform the actions, 
  
- First it will include all the aforementioned files, and will run the functions. 
- HW_3_Data.jl is the primary file where the stoiciometric matrix is stored, the bounds are created, the v_max values are calcualted, and the literature constants Km and Concentrations are stored. 
- Once it is called from the Run.jl it will give the stoiciometric matrix as S, will calculate the v_max values from the 
   Km and concentrations 
   
    -------------------------------------------------------------------------------------------------------------------------  
    
   NOTE: that not all of the metabolites had KM and concentration values in the literature source used, in this case 
   the V_max equation component  [ x ] / ( km + [ x ] ) is assumed to be 1 where [ x ] = concentration of x and is 
   much greater than km, i.e [ x ] >>> Km thus v_max is just E * K_cat for that reaction
   after the v_max is solved the code will put those into the bounds array,
   
    -------------------------------------------------------------------------------------------------------------------------  
   
   NOTE: bounds array is given bounds from 0 to 10 mmol/gDw-hr except for reversible source and sink exchanges 
   these are allowed to go from -10 < 0 < 10 mmol/gDw-hr to allow for the metabolites to "exchange" with the surroundings
       
   -------------------------------------------------------------------------------------------------------------------------    
- Atom_array will take a written out atom matrix for the reaction scheme and perform the A * S syntax to generate a balance array
- Atom_array will then only take the reaction  (noted as v) portion of the array and will then summ the rows to create a 5x1 vector
- This vector will then be summed along the column to perform a test for any non zero values, If a non zero value is in the compressed array, Atom_array will return a string that says TRUE and it is balanced
- If not balanced it will return FALSE, if false check the balance_array in the workspace to see the unbalanced element.

  -------------------------------------------------------------------------------------------------------------------------  


- Once these are done the arrays are passed into the calulate optimal flux code from the Varner lab and the objective value is
   found
        
- the end of the code will print out 
- Part A: Will show the stoiciometric matrix
- Part B: Will say " {TRUE/FALSE} the Reactions are {NOT} balanced " where words in {} will depend on if it is balanced or not
- Part C: Will say " The optimal Urea production rate is {xxxx} " where {xxxx} will correspond to the calcualted FBA flux for urea
        
        
