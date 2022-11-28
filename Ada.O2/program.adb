with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure program is 
   
  function "-"(A : in Integer; B : in Float) return Float is
  begin 
     return Float(A)-B;
  end "-";
  
  function S_Char (C : in Character) return Boolean is 
  begin
     return C = 's'or C = 'S';
  end S_Char;
  
  
  procedure S_String (S : in out String; B : out Boolean) is
     C : Character;
  begin
     C := S(S'Last);
     if (not(C = 's')) then
	S := S(S'First..S'Last-1) & "s";
	B := False;
     else
	B := True;
     end if;
  end S_String;
     
  A : Integer;  
  B : Float;
  S : String(1..5);
  StringLastIsS: Boolean;
  C : Character;
      
begin
   Put("Mata in ett heltal och ett flyttal: ");
   Get(A);
   Get(B);
   Skip_Line;
   Put("Differensen mellan dem är ");
   Put(A-B,0,2,0);
   New_Line(2);
   
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(S);
   Skip_Line;
   S_String(S(1..5),StringLastIsS);
   if (StringLastIsS) then
      Put_Line("Ordet " & S & " var troligtvis i plural från början");
   else 
      Put_Line("Ordet " & S & " var troligtvis inte i plural från början");
   end if;
   New_Line;
   
   Put("Mata in ett tecken: ");
   Get(C);
   Skip_Line;
   if (S_Char(C)) then
      Put_Line("Tecknet var sant");
   else 
      Put_Line("Tecknet var inte sant");
   end if;
end Program;
