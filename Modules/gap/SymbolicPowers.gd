#############################################################################
##
##  SymbolicPowers.gd                                      Modules package
##
##  Copyright 2013, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations for symbolic powers.
##
#############################################################################

DeclareOperation( "SymbolicJoinOfIdeals",
        [ IsHomalgModule, IsHomalgModule ]);

DeclareOperation( "SymbolicPower",
        [ IsHomalgModule, IsInt ]);
