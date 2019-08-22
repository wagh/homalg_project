#############################################################################
##
##  SymbolicPowers.gd                                      Modules package
##
##  Copyright 2013, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations for symbolic powers.
##
#############################################################################

##  <#GAPDoc Label="SymbolicPower">
##  <ManSection>
##    <Oper Arg="I,n" Name="SymbolicPower"/>
##    <Returns>a &homalg; module</Returns>
##    <Description>
##      For an ideal <A>I</A>, construct the <A>n</A>-th symbolic power of <A>I</A>.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "SymbolicPower",
        [ IsHomalgModule, IsInt ]);

DeclareOperation( "SymbolicPower",
        [ IsHomalgMatrix, IsInt ]);
