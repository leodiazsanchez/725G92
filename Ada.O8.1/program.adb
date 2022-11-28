-- leodi727: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure program is
   
   type Nums is array (Character range 'a'..'g') of Integer;
   
   Numbers : constant Nums := (1, 7, 12, 42, 112, 365, 1024);
   
   function IsViking (Str : in String) 
		     return Boolean is
   begin 
      for I in Str'Range loop
	 if not (Str(I) in Nums'Range) then
	    return False;
	 end if;
      end loop;
      return True;
   end;
   
   function Calculate_Value(Str: in String) 
			   return Integer is
      Value : Integer := 0;
   begin
      for I in Str'Range loop
	 Value := Value + Numbers(Str(I));
      end loop;
      return Value;
   end;
   
   procedure Correct_Value (Value : in Integer;
			    C : out Character) is
   begin 
      if Value >= Numbers('g') then
	 C := 'g';
      elsif Value >= Numbers('f') then
	 C := 'f';
      elsif Value >= Numbers('e') then
	 C := 'e';
      elsif  Value >= Numbers('d') then
	 C := 'd';
      elsif  Value >= Numbers('c') then
	 C := 'c';
      elsif  Value >= Numbers('b') then
	 C := 'b';
      elsif  Value >= Numbers('a') then
	 C := 'a';
      end if;
   end;
   
   function Correct_String (Str : in String) 
			   return String is
      S : String(1..31);
      Value : Integer := Calculate_Value(Str);
      Index : Integer := S'First;
      C : Character;
   begin 
      S := "                               ";
      loop
	 Correct_Value(Value,C);
	 S(Index) := C;
	 Value := Value - Numbers(C);
	 Index := Index + 1;
	 exit when Value = 0;
      end loop;

      return S;
   end;
   
   procedure Insert_Line(File : in out File_Type;
			 Str : in String) is
      Separator : String := "|";
      S : String:= "                    ";
   begin
      for I in Str'Range loop
	 S(I) := Str(I);
      end loop;
      Put(File,Separator);
      Put(File,S);
      Put(File,Separator);
      if Correct_String(Str)(Str'First..Str'Last) = Str then
	 Put(File,"                               ");
      else 
	 Put(File,Correct_String(Str));
      end if;
      Put(File,Separator);
      Put(File,Calculate_Value(Str), Width => 10);
      Put(File,Separator);
      New_Line(File);
   end;
   
   procedure Put_File_Begining(File : in File_Type) is
   begin
      Put_Line(File,"|Inläst sträng       |Korrigerat vikingskt tal       |Värde     |");
      Put_Line(File,"=================================================================");
   end;
   
   procedure Put_File_Ending(File : in File_Type) is
   begin
      Put_Line(File,"=================================================================");
   end;
   
   procedure Put_Biggest(Int : in Integer; 
			 Str : in String) is
      Counter : Integer := 0;
   begin
      Put("Största som heltal: ");
      Put(Int, Width => 0);
      New_Line;
      for I in Str'Range loop
	 if Str(I) /= ' ' then
	    Counter := Counter + 1;
	 end if;
      end loop;
      Put("Största som vikingskt tal: " & Str(Str'First..Counter));
   end;
   
   procedure Viking (File : in String) is
      Input, Output : File_Type;
      S : String(1..21);
      Biggest_Str : String(1..31); 
      L : Integer;
      Biggest_Int : Integer := 0;
   begin
      Open(Input, In_File, File);
      Create(Output, Out_File, "CORRECTED_VIKING_NUMBERS.TXT");
      
      Put_File_Begining(Output);

      while not End_Of_File(Input) loop
	 Get_Line(Input,S,L);
	 if IsViking(S(1..L)) then
	    Insert_Line(Output,S(1..L));
	    
	    if Calculate_Value(S(1..L)) > Biggest_Int then
	       Biggest_Int :=  Calculate_Value(S(1..L));
	       Biggest_Str := Correct_String(S(1..L));
	    end if;
	 end if;		  	 
      end loop;
      
      Put_File_Ending(Output);
      Put_Biggest(Biggest_Int,Biggest_Str);
      
      Close(Input);
      Close(Output);
   end;
   
begin
   if Argument_Count = 1 then
      Viking(Argument(1));
   else
      Put_Line("felaktigt antal argument!");
      Put("Användning: ");
      Put(Command_Name);
      Put(" FILNAMN.TXT");
   end if;
end;
