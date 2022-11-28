with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Program is 
   type DS1 is
      record 
	 W : Character;
	 P : String(1..4);
      end record;
   
   type DS2_Inner is
      record 
	 S : Float;
	 Z : String(1..4);    
      end record;
   
   type DS2 is
      record
	 D,U : DS2_Inner;
      end record;
   
   
   type DS3_Inner1 is
      record 
	 Y,Q : Character;
      end record;
   
   type DS3_Inner2 is
      record 
	 T : Boolean := False;
	 L : Character;
      end record;
   
   type DS3 is
      record 
	 J, B : DS3_Inner1;
	 O : DS3_Inner2;
      end record;
   
   procedure Get(Data : out DS1) is 
      C : Character; 
   begin
      Get(Data.W);
      Get(C);
      Get(Data.P);
   end Get;
   
   procedure Get(Data : out DS2_Inner) is
      C : Character;
   begin
      Get(Data.S);
      Get(C);
      Get(Data.Z);
   end;
   
   procedure Get(Data : out DS2) is 
      C : Character; 
   begin
      Get(Data.D);
      Get(C);
      Get(Data.U);
   end Get;
   
   procedure Get(Data : out DS3_Inner1) is
      C : Character;
   begin 
      Get(Data.Y);
      Get(C);
      Get(Data.Q);
      Get(C);
   end;
   
   procedure Get(Data : out DS3_Inner2) is
      C : Character;
   begin
      Get(C);
      if C = 'T' then
	 Data.T := True;
      else
	 Data.T := False;
      end if;
      Get(C);
      Get(Data.L);
   end;
   
   procedure Get(Data : out DS3) is 
   begin
      Get(Data.J);
      Get(Data.B);
      Get(Data.O);
   end Get;
   
   procedure Put(Data : in DS1) is
   begin
      Put(Data.W);
      Put(" ");
      Put(Data.P);
   end Put;
   
   procedure Put(Data : in DS2_Inner) is
   begin
      Put(Data.S,0,3,0);
      Put(" ");
      Put(Data.Z);
   end;
     
   procedure Put(Data : in DS2) is
   begin
      Put(Data.D);
      Put(" ");
      Put(Data.U);
   end Put;
   
   procedure Put(Data : in DS3_Inner1) is
   begin
      Put(Data.Y);
      Put(" ");
      Put(Data.Q);
   end;
   
   procedure Put(B : in Boolean) is
   begin
      if B then
	 Put("True");
      else
	 Put("False");
      end if;
   end;
   
   procedure Put(Data : in DS3_Inner2) is
   begin
      Put(Data.T);
      Put(" ");
      Put(Data.L);
   end;
   
   procedure Put(Data : in DS3) is
   begin
      Put(Data.J);
      Put(" ");
      Put(Data.B);
      Put(" ");
      Put(Data.O);
   end Put;
   
   Data1 : DS1;
   Data2 : DS2;
   Data3 : DS3;
   
begin 
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(Data1);
   Put("Inmatad datamängd: ");
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
   Put("Inmatad datamängd: ");
   Put(Data3);
end;
