with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Program is
   
begin
   
   if Argument_Count = 0 then
      Put_Line("Inga argument angivna.");
   elsif Argument_Count = 2 then
      Put("Meddelande: ");
      for I in 1..Integer'Value(Argument(1)) loop
	 Put(Argument(2));
      end loop;
      New_Line;
      Put("Programmet """ & Command_Name & """ avslutas.");
   else 
      Put_Line("Fel antal argument angivna.");
   end if;
end;
