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
InstallMethod( SymbolicJoinOfIdeals,
        "for two ideals on the same ring",
        [ IsHomalgModule, IsHomalgModule ],

  function( I, J )
    local R, indets, newR, newvars, imageY, phiY, newI, imageZ, phiZ, newJ, l, bigIdeal;
      
      if not HomalgRing( I ) = HomalgRing( J ) then
          TryNextMethod();
      fi;
      
      R := HomalgRing( I );
      indets := Indeterminates( R );
      newR := R * List( [ 1..Size(indets) ], i -> Concatenation( "@t(", String( i ), ")" ) );
      newvars := RelativeIndeterminatesOfPolynomialRing( newR );
      
      imageY := List( [ 1..Size( Indeterminates( R ) ) ], i -> newvars[i] );
      phiY := RingMap( imageY, R, newR );
      newI := Pullback( phiY, I );
      
      imageZ := List( [ 1..Size( Indeterminates( R ) ) ], i -> indets[i]/newR-newvars[i] );
      phiZ := RingMap( imageZ, R, newR );
      newJ := Pullback( phiZ, J );
      
      l := EntriesOfHomalgMatrix( MatrixOfGenerators( I ) ); 
      Append( l, EntriesOfHomalgMatrix( MatrixOfGenerators( J ) ) );
      bigIdeal := LeftSubmodule( l, HomalgRing( I ) );
      
          
end );

##
InstallMethod( SymbolicPower,
        "for an ideal and an integer",
        [ IsHomalgModule, IsInt ],
        
  function( I, n )
    local R, m, pr, ass, joins;
      
    if not IsPosInt( n ) then
        TryNextMethod();
    fi;
    
    if n = 1 or IsZero( I ) then
        return I;
    fi;
    
    if IsOne( I ) then
        return One( R );
    fi;
    
    R := HomalgRing( I );
    if not ( IsPolynomialRing( R ) or HasIndeterminatesOfPolynomialRing( R ) or HasCoefficientsRing( R ) ) then
        TryNextMethod();
    fi;
    
    m := AMaximalIdealContaining( LeftSubmodule( Zero( R ) ) );
    
    if IsPrime( I ) then
        return SymbolicJoinOfIdeals( I, m^n );
    fi;
    
    pr := PrimaryDecomposition( I );
    ass := List( pr, i -> i[2] );
    joins := List( ass, i -> SymbolicJoinOfIdeals( i, m^n ) );
    
    return Iterated( joins, Intersect2 );
    
end );
