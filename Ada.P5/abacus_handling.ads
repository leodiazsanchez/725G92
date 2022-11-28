package abacus_handling is
   
type Abacus_Type is private;
   
procedure Get(Arr : out Abacus_Type);
procedure Put(Arr : in Abacus_Type);   
   
private 
   
   type Integer_Pair is
      record
	 First,Second : Integer;
      end record;
   
   type Abacus_Type is array (1..10) of Integer_Pair;
end;
