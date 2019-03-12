# stoichiometric_matrix for part a

#See suplemental PDF for a diagram and additional written out reaction schemes
#For part a, S is a Stoiciometric matrix of 18 x 21 dimention.

#rows are metabolites (18 metabolites) and columns are reactions
#           Metabolites
# 1   Carbamoyl phosphate [CPH]
# 2   orthophosphate      [PHO]
# 3   Citrulene           [CIT]
# 4   Nitrogen Monoxide   [NO_]
# 5   NADP+               [NAD]
# 6   Water               [H2O]
# 7   Aspartate           [ASP]
# 8   ATP                 [ATP]
# 9   AMP                 [AMP]
# 10  Argino-succinate    [ARS]
# 11  Fumarate            [FUM]
# 12  Arginine            [ARG]
# 13  NADPH               [NPH]
# 14  Hydrogen            [H__]
# 15  Oxygen (diatomic)   [O2_]
# 16  Urea                [URA]
# 17  Ornithene           [ORT]
# 18  Diphosphate         [DPH]

#balances for      d[x]/dt = [S]*[r]     are as follows
# d[CPH]/dt = b1 - v4
# d[PHO]/dt = v4 - b5
# d[CIT]/dt = v4 + 2*(v5+) - 2*(v5-) - v1
# d[NO_]/dt = 2*(v5+) + b12 - 2*(v5-)
# d[NAD]/dt = 3*(v5+) + b13 - 3*(v5-)
# d[H2O]/dt = b8 + 4*(v5+) - b14 - 4*(v5-) - v3
# d[ASP]/dt = b2 - v1
# d[ATP]/dt = b6 - v1
# d[AMP]/dt = v1 - b7
# d[ARS]/dt = v1 - v2
# d[FUM]/dt = v2 - b3
# d[ARG]/dt = 2*(v5-) + v2 - 2*(v5+) - v3
# d[NPH]/dt = 3*(v5-) - b9 - 3*(v5+)
# d[H__]/dt = 3*(v5-) - b10 - 3*(v5+)
# d[O2_]/dt = 4*(v5-) - b11 - 4*(v5+)
# d[URA]/dt = v3 - b4
# d[ORT]/dt = v3 - v4
# d[DPH]/dt = v1 - b15


#stoichiometric_matrix
#      v1  v2  v3  v4  v5+ v5- b1  b2  b3  b4  b5  b6  b7  b8  b9  b10 b11 b12 b13 b14 b15
S = [  0   0   0  -1   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
       0   0   0   1   0   0   0   0   0   0  -1   0   0   0   0   0   0   0   0   0   0 ;
      -1   0   0   1   2  -2   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
       0   0   0   0   2  -2   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0 ;
       0   0   0   0   3  -3   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0 ;
       0   0  -1   0   4  -4   0   0   0   0   0   0   0   1   0   0   0   0   0  -1   0 ;
      -1   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
      -1   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0 ;
       1   0   0   0   0   0   0   0   0   0   0   0  -1   0   0   0   0   0   0   0   0 ;
       1  -1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
       0   1   0   0   0   0   0   0  -1   0   0   0   0   0   0   0   0   0   0   0   0 ;
       0   1  -1   0  -2   2   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
       0   0   0   0  -3   3   0   0   0   0   0   0   0   0  -1   0   0   0   0   0   0 ;
       0   0   0   0  -3   3   0   0   0   0   0   0   0   0   0  -1   0   0   0   0   0 ;
       0   0   0   0  -4   4   0   0   0   0   0   0   0   0   0   0  -1   0   0   0   0 ;
       0   0   1   0   0   0   0   0   0  -1   0   0   0   0   0   0   0   0   0   0   0 ;
       0   0   1  -1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ;
       1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  -1 ; ];

#Convert the matrix to float64
S = convert(Array{Float64}, S);


#generate the default_bounds_array for the fluxes,
# note fluxes b9,b10,b11,b12,b13 are allowed to be reversible for exchange of those metabolites

default_bounds_array = [
                         0.0 10.0     # v1         mmol/gDW-hr
                         0.0 10.0     # v2         mmol/gDW-hr
                         0.0 10.0     # v3         mmol/gDW-hr
                         0.0 10.0     # v4         mmol/gDW-hr
                         0.0 10.0     # v5+        mmol/gDW-hr
                         0.0 10.0     # v5-        mmol/gDW-hr
                         0.0 10.0     # b1         mmol/gDW-hr
                         0.0 10.0     # b2         mmol/gDW-hr
                         0.0 10.0     # b3         mmol/gDW-hr
                         0.0 10.0     # b4         mmol/gDW-hr
                         0.0 10.0     # b5         mmol/gDW-hr
                         0.0 10.0     # b6         mmol/gDW-hr
                         0.0 10.0     # b7         mmol/gDW-hr
                         0.0 10.0     # b8         mmol/gDW-hr
                        -10.0 10.0     # b9         mmol/gDW-hr
                        -10.0 10.0     # b10        mmol/gDW-hr
                        -10.0 10.0     # b11        mmol/gDW-hr
                        -10.0 10.0     # b12        mmol/gDW-hr
                        -10.0 10.0     # b13        mmol/gDW-hr
                         0.0 10.0     # b14        mmol/gDW-hr
                         0.0 10.0     # b15        mmol/gDW-hr
                                  ];


#bounds calculation for reactions v1, v2 v3 v4 v5

#K_cat values for each reaction
K_cat_v1 = 203*3600  ; #h^-1
K_cat_v2 = 34.5*3600 ; #h^-1
K_cat_v3 = 249*3600  ; #h^-1
K_cat_v4 = 88.1*3600 ; #h^-1
K_cat_v5 = 13.7*3600 ; #h^-1

#Enzyme Concentration
E_given = 0.01       ; #micromole/gDW
E = E_given / 1000   ; #mmol/gDW

#Concentrations of Metabolites from given literature for humans, but not enzyme classification specific due to lack of data
C_NADP      = 2.84*10^-5; # M
C_NADPH     = 6.54*10^-5; # M
C_ASPARTATE = 1.49*10^-2; # M
C_ATP       = 4.67*10^-3; # M
C_AMP       = 4.23*10^-5; # M
C_FUMARATE  = 4.85*10^-4; # M
C_ARGININE  = 2.55*10^-4; # M


#KM values from literature for humans, but not enzyme classification specific due to lack of data
Km_NADP      = 2.7*10^-5;  # M
Km_NADPH     = 1.5*10^-6;  # M
Km_ASPARTATE = 2.25*10^-2; # M
Km_ATP       = 3.0*10^-5;  # M
Km_AMP       = 6.46*10^-5; # M
Km_FUMARATE  = 5.3*10^-3 ; # M
Km_ARGININE  = 3.50*10^-6; # M

#Vmax calulations of the five reactions, v5 was split into two reactions v5+ and v5-
V1_max = K_cat_v1*E*(C_ASPARTATE/(Km_ASPARTATE+C_ASPARTATE))*(1)*(C_ATP/(Km_ATP+C_ATP));
V2_max = K_cat_v2*E*(1)*(1);
V3_max = K_cat_v3*E*(C_ARGININE/(Km_ARGININE + C_ARGININE))*(1);
V4_max = K_cat_v4*E*(1)*(1);
V5_plus_max = K_cat_v5*E*(C_ARGININE/(Km_ARGININE + C_ARGININE))*(C_NADPH/(Km_NADPH + C_NADPH))*(1)*(1);
V5_mins_max = K_cat_v5*E*(C_NADP/(Km_NADP + C_NADP));

#put the new bounds for the reactions into the default bounds array
default_bounds_array[1,2] = V1_max ;
default_bounds_array[2,2] = V2_max ;
default_bounds_array[3,2] = V3_max ;
default_bounds_array[4,2] = V4_max ;
default_bounds_array[5,2] = V5_plus_max ;
default_bounds_array[6,2] = V5_mins_max ;

#species_bounds_array, left hand side of the equation d[x]/dt = [S]*[r], set to zero for this homework
species_bounds_array = [
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                           0.0    0.0 ;
                                       ] ;

# array to set the objective value, will be given a value in the run file
objective_coefficient_array = [
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                0.0
                                    ];
