with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Discrete_Random; 
with Ada.Numerics.Float_Random;
procedure Program is 
   
   subtype Int_Range is Integer range 1..6;
   
   subtype Char_Range is Character range 'A' .. 'Z';
   
   package Random_Int_Package is
      new Ada.Numerics.Discrete_Random(Int_Range);
   
   package Random_Char_Package  is
      new Ada.Numerics.Discrete_Random(Char_Range);
 
   Number_Of_Integers, Number_Of_Characters : Integer;
   G_Int: Random_Int_Package.Generator;
   G_Char : Random_Char_Package.Generator;
   G_Float : Ada.Numerics.Float_Random.Generator;
   Min, Max, Random_Float : Float;

begin 
   --Random_Int_Package.Reset(G_Int);
   --Random_Char_Package.Reset(G_Char);
   --Ada.Numerics.Float_Random.Reset(G_Float);
   
   Put("Mata in antalet heltal som ska slumpas: ");
   Get(Number_Of_Integers);
   Put(Number_Of_Integers,Width => 0);
   case Number_Of_Integers is
      when 1 =>  Put(" slumpat heltal:");
      when others => Put(" slumpade heltal:");
   end case;
   for I in 1..Number_Of_Integers loop
      Put(Random_Int_Package.Random(G_Int), Width => 2);
   end loop;
   
   New_Line;
   Number_Of_Characters := Random_Int_Package.Random(G_Int);
   Put(Number_Of_Characters, Width => 0);
   case Number_Of_Characters is
      when 1 => Put(" slumpat tecken:");
      when others => Put(" slumpade tecken:");
   end case;
   
   for I in 1..Number_Of_Characters loop
      Put(" " & Random_Char_Package.Random(G_Char));
   end loop;
   
   New_Line;
   Put("Mata in två flyttal: ");
   Get(Min);
   Get(Max);
   Put("Slumpat flyttal mellan ");
   Put(Min,0,2,0);
   Put(" och ");
   Put(Max,0,2,0);
   Put(": ");
   Random_Float := Ada.Numerics.Float_Random.Random(G_Float) * (Max-Min) + Min;
   Put(Random_Float,0,2,0);
end Program;
