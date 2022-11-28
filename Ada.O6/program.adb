-- leodi727: Arbetat enskilt

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
procedure program is
   
   function Fib (N : in Integer) return Integer is
   begin
      if N = 1 or N = 2 then
	 return 1;
      else 
	 return Fib(N-1) + Fib(N-2);
      end if;
   end;
   
   function HH (N : in Integer) return Integer is
   begin
      if N = 1 then
	 return 0;
      elsif N = 2 then
	 return 1;
      else
	 return (N-1)*(2*(N-1)-1) + HH(N-1);
      end if;
   end;   
      
   N1,N2 : Integer;
   
begin
   Put("Mata in N och HH: ");
   Get(N1);
   Get(N2);
   Put("Fibonacci-tal nummer ");
   Put(N1, Width => 0);
   Put(" är ");
   Put(Fib(N1), Width => 0);
   Put(".");
   New_Line;
   Put("Det behövs ");
   Put(HH(N2), Width => 0);
   Put(" stenar för att bygga trappan.");
end;
