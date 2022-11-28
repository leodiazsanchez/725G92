with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Program is
   
   procedure Part1(S1,S2 : out String; 
		   Div : out Integer) is
   begin
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(S1);
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(S2);
      
      Div :=  Integer(Float'Value(S1)) / Integer(Float'Value(S2));
   end;
   
   function Part2(F : in Float; C : in Character) 
		 return Float is

   begin      
      return Float'Rounding(F + Float(Character'Pos(C)-Character'Pos('0')));
   end;
   
   function Part3 (I : in Integer) 
		  return Float is
   begin
      return Float'Floor(Float(I) - 32.7);
   end;
   
   
   S1,S2 : String(1..3);
   Res1, Num : Integer;
   
   F : Float;
   C : Character;
   
begin
   Part1(S1,S2,Res1);
   Put("Du matade in strängen: ");
   Put(S1);
   Put(" och strängen: ");
   Put(S2);
   Put(" och kvoten blev");
   Put(Res1, Width => 12);
   New_Line(2);
   
   Put("Mata in ett flyttal: ");
   Get(F);
   Put("Mata in ett tecken: ");
   Get(C);
   Put("Den beräknade summan av ");
   Put(F,0,1,0);
   Put(" och ");
   Put(C);
   Put(" blir ");
   Put(Part2(F,C),0,1,0);
   New_Line(2);
   
   Put("Mata in ett heltal: ");
   Get(Num);
   Put("differensen mellan ");
   Put(Num,Width => 0);
   Put(" och 32.7 blir ");
   Put(Part3(Num),0,1,0);
end;
