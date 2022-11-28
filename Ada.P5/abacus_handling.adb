with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Abacus_Handling is
   
   procedure Get(Pair : out Integer_Pair) is
   begin
      Get(Pair.First);
      Get(Pair.Second);
   end;
		   
   
   procedure Get(Arr : out Abacus_Type) is
   begin
      for I in Arr'Range loop
	 Get(Arr(I));
      end loop;
   end;   
   
   function Get_Width(Arr : in Abacus_Type) 
		     return Integer is
      Max : Integer := 0;
      Current : Integer;
   begin
      for I in Arr'Range loop
	 Current := Arr(I).First + Arr(I).Second;
	 if Current > Max then
	    Max := Current;
	 end if;
      end loop;
      return Max;
   end;
   
   procedure Put(Arr: in Abacus_Type) is
      Max_Width,Width : Integer;
   begin
      
      Max_Width := Get_Width(Arr);
      
      for I in Arr'Range loop
	 Width := Max_Width - Arr(I).First - Arr(I).Second;
	 Put("|");
	 
	 for A in 1..Arr(I).First loop
	    Put("*");
	 end loop;
	 
	 for B in 1..Width loop
	    Put("-");
	 end loop;
	 
	 for C in 1..Arr(I).Second loop
	    Put("*");
	 end loop;
	 
	 Put("|");
	 New_Line;
      end loop;

   end;
end;
