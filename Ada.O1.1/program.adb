with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure program is

   i : Integer;
   c : Character;
   f : Float;
   s : String(1..5);
   
begin

    Put("Skriv in ett heltal: ");
    Get(i);
    Skip_Line;
    Put("Du skrev in talet: ");
    Put(I, Width => 0);
    New_Line(2); 
    
    Put("Skriv in fem heltal: ");
    Get(i);
    Put("Du skrev in talen: ");
    Put(I, Width => 0);
    Put(" ");
    Get(I);
    Put(I, Width => 0);
    Put(" ");
    Get(I);
    Put(I, Width => 0);
    Put(" ");
    Get(I);
    Put(I, Width => 0);
    Put(" ");    
    Get(I);
    Put(I, Width => 0);
    Skip_Line;
    New_Line(2);
    
    Put("Skriv in ett flyttal: ");
    Get(f);
    Skip_Line;
    Put("Du skrev in flyttalet: ");
    Put(F, 0,3,0);
    New_Line(2); 
    
    Put("Skriv in ett heltal och ett flyttal: ");
    Get(i);
    Get(f);
    Skip_Line;
    Put("Du skrev in heltalet:");
    Put(I, Width => 10);
    New_Line;
    Put("Du skrev in flyttalet:");
    Put(F, 4,4,0);
    New_Line(2);    
    
    Put("Skriv in ett tecken: ");
    Get(c);
    Skip_Line;
    Put("Du skrev in tecknet: " & c);
    New_Line(2);
    
    Put("Skriv in en sträng med 5 tecken: ");
    Get(S(1..5));
    Skip_Line;
    Put("Du skrev in strängen: " & S(1..5));
    New_Line(2);
    
    Put("Skriv in en sträng med 3 tecken: ");
    Get(s(1..3));
    Skip_Line;
    Put("Du skrev in strängen: " & S(1..3));
    New_Line(2);
    
    Put("Skriv in ett heltal och en sträng med 5 tecken: ");
    Get(I,Width => 0);
    Get(C);
    Get(S(1..5));
    Skip_Line;
    Put("Du skrev in talet |");
    Put(I,Width=>0);
    Put("| och strängen |" & S(1..5) & "|.");
    New_Line(2);
    
    Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
    Get(S(1..3));
    Get(F);
    Skip_Line;
    Put("Du skrev in ");
    Put(Character'Val(34));
    Put(F, 2,3,0);
    Put(Character'Val(34));
    Put(" och " & Character'Val(34) & S(1..3) & Character'Val(34) & ".");
    New_Line(2);
    
    Put("Skriv in en sträng som är maximalt 5 tecken: ");
    Get_Line(S(1..5), i);
    Put("Du skrev in strängen: " & S(1..I));
    if I >= 5 then
       Skip_Line;
    end if;
    New_Line(2);

    Put("Skriv in en sträng som är maximalt 5 tecken: ");
    Get_Line(S(1..5), i);
    if(i <  5) then
       Put("Du skrev in strängen: " & S(1..I));
    else  
       Put("Du skrev in strängen: " & S(1..5));      
    end if;
    
end program;
