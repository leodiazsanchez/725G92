with Ada.Text_IO;     use Ada.Text_IO;
with Abacus_Handling; use Abacus_Handling;

procedure Abacus_Program is
   Abacus: Abacus_Type;
begin
   Put_Line("Enter abacus:");
   Get(Abacus);
   
   Put_Line("Abacus:");
   Put(Abacus);
end Abacus_Program;
