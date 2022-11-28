with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure program is 
   
   First,Last,Steps,Percentage,Tax : Float;
   Laps : Integer;
   Counter : Integer := 0;
   Upper_Bound : Float := 10000.0;
   Lower_Bound : Float := 0.0;
   
begin
      
   loop    
      Put("Första pris: ");
      Get(First);
      exit when (First >= Lower_Bound and First < Upper_Bound);
      Put_Line("Felaktigt värde!");
   end loop;  

   loop	 
      Put("Sista pris: ");
      Get(Last);

 
      if(Last >= Lower_Bound and Last < Upper_Bound and Last >= First) then
	 exit;
      else 
	 Put_Line("Felaktigt värde!");
      end if;
  end loop;

  loop 
     Put("Steg: ");
     Get(Steps);
		    
     if(Steps > Lower_Bound) then
	exit;
     else
	 Put_Line("Felaktigt värde!");
     end if;
  end loop;
	
  
  loop 
     Put("Momsprocent: ");
     Get(percentage);
     
     if(Percentage >= Lower_Bound and Percentage <= 100.0) then
	exit;
     else 
	Put_Line("Felaktigt värde!");  
     end if;
  end loop;
  
  Laps := Integer(Float'Floor((Last - First)/Steps));
  
  New_Line;
  Put_Line("============ Momstabell ============");
  Put_Line("Pris utan moms  Moms   Pris med moms");
  for I in 0..Laps loop
    Put(First,Fore => 6, Aft => 2, Exp => 0);
    Tax := (First * Percentage)/100.0;
    Put(Tax,Fore => 8, Aft =>2, Exp => 0);
    Put(First + Tax,Fore => 9,Aft =>2, Exp =>0);
    First := First + Steps;
    New_Line;
  end loop;
end program;
