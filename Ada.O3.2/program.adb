-- leodi727: Arbetat enskilt

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Program is
   
   type DS1 is 
     array(31..35) of Float;
   
   type DS2_Inner is 
     array(Character range '5'..'9') of String(1..5);
   
   type DS2 is 
     array(Boolean range False..True) of DS2_Inner;
   
   type DS3 is 
     array(73..74, Character range '4'..'8') of Integer;
   
   procedure Get(Data : out DS1) is
   begin
      for I in reverse Data'Range loop
	 Get(Data(I));
      end loop;
   end Get;
   
   procedure Get(Data : out DS2_Inner) is
      C : Character;
   begin 
      for I in reverse Data'Range loop
	 Get(Data(I));
	 if I /= Data'First then
	    Get(C);
	 end if;
      end loop;
   end;
   
   procedure Get(Data : out DS2) is
      C : Character;
   begin
      for I in Data'Range loop
	 Get(Data(I));
	 if I = False then
	    Get(C);
	 end if;
      end loop;
   end Get;
   
   procedure Get(Data : out DS3) is
   begin
      for X in Data'Range(1) loop
	 for Y in Data'Range(2) loop
	    Get(Data(X,Y));
	 end loop;
      end loop;
   end Get;
   
   procedure Put(Data : in DS1) is
   begin
      for I in reverse Data'Range loop
	 Put(" ");
	 Put(Data(I),0,3,0);
      end loop;
   end Put;
   
   procedure Put(Data : in DS2_Inner) is
   begin
      for I in reverse DS2_Inner'Range loop
	 Put(Data(I));
	 if I /= Data'First then
	    Put(" ");
	 end if;
      end loop;
   end;
   
   procedure Put(Data : in DS2) is
   begin   
      for I in Data'Range loop
	 Put(Data(I));
	 if I = False then
	    Put(" ");
	 end if;
      end loop;
   end Put;
   
   procedure Put(Data : in DS3) is
   begin   
      for X in Data'Range(1) loop
	 for Y in Data'Range(2) loop
	    Put(" ");
	    Put(Data(X,Y),Width=>0);
	 end loop;
      end loop;      
   end Put;  
   
   Data1 : DS1;
   Data2 : DS2;
   Data3 : DS3;

begin
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(Data1);
   Put("Inmatad datamängd:");
   Put(Data1);
   New_Line(2);
   
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(Data2);
   Put("Inmatad datamängd: ");
   Put(Data2);
   New_Line(2);
   
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(Data3);
   Put("Inmatad datamängd:");
   Put(Data3);
   
end Program;
