#############################################################################
##
##  SymmetricAlgebra.gi                                      Modules package
##
##  Copyright 2013, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations for symmetric powers.
##
#############################################################################

##
InstallMethod( SymbolicPower,
        "for an ideal and an integer",
        [ IsHomalgModule, IsInt ],

        function( I, n )
    local R, indets, i, kxy;

    if not IsPosInt( n ) then
        TryNextMethod();
    fi;

    if n = 1 then
        return I;
    fi;
    
    if IsZero( I ) then
        return false;
    fi;
    
    if IsOne( I ) then
        return One( R );
    fi;
    
    R := HomalgRing( I );
    if not ( IsPolynomialRing( R ) or HasIndeterminatesOfPolynomialRing( R ) or HasCoefficientsRing( R ) ) then
        TryNextMethod();
    fi;
    
    indets := Indeterminates( R );
    
    indets;
    
    if IsPrimeModule( I ) then
        return JoinOfIdeals( I, maxideal(n)));
    fi;


end);
    
