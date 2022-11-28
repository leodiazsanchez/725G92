with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Program is
   
   function Calculate_Factorial(N : in Integer) return Integer is 
      Factorial : Integer := 1;
   begin
      for I in 1..N loop
	 Factorial := Factorial * I;
      end loop;
      return Factorial;
   end Calculate_Factorial;
   
   function Calculate_Hypothenuse(A,B : in Integer) return Float is 
   begin 
      return Float(Ada.Numerics.Elementary_Functions.Sqrt(Float(A**2 + B**2)));
   end Calculate_Hypothenuse;
   
   procedure Calculate_Angles (Hc,Sa : in Float; Va,Vb,Vc : out Float) is
      Sb : Float;
   begin
      Sb := Ada.Numerics.Elementary_Functions.Sqrt(HC**2 - Sa**2);
      Va := 180.0 / Ada.Numerics.Pi * Ada.Numerics.Elementary_Functions.ArcSin(Sa / Hc);
      Vb := 180.0 / Ada.Numerics.Pi * Ada.Numerics.Elementary_Functions.ArcSin(Sb / Hc);      
      Vc := 90.0;
   end Calculate_Angles;
   
   procedure Hypothenuse_Program is 
      First_Leg, Second_Leg : Integer;
   begin
      Put("Mata in kateternas längder: " );
      Get(First_Leg);
      Get(Second_Leg);
      Put("Hypotenusan är ");
      Put(Calculate_Hypothenuse(First_Leg,Second_Leg),0,2,0); 
      New_Line(2);
   end Hypothenuse_Program;
   
   procedure Angle_Program is
      Hypo,First_Leg,Va,Vb,Vc : Float;
   begin
      Put("Mata in hypotenusans längd: ");
      Get(Hypo);
      Put("Mata in vertikala katetens längd: ");
      Get(First_Leg);
      Skip_Line;
      Calculate_Angles(Hypo,First_Leg,Va,Vb,Vc);
      Put("Va: ");
      Put(Va,0,1,0);
      Put(" grader");
      New_Line;
      Put("Vb: ");
      Put(Vb,0,1,0);
      Put(" grader");
      New_Line;
      Put("Vc: ");
      Put(Vc,0,1,0);
      Put(" grader");
      New_Line(2);
   end Angle_Program;
   
   procedure Factorial_Program is 
      Factorial : Integer;
   begin
      Put("Mata in N: ");
      Get(Factorial);
      Put(Factorial, Width => 0);
      Put("-fakultet = ");
      Put(Calculate_Factorial(Factorial), Width => 0);
      New_Line(2);      
   end Factorial_Program;
   
   procedure Menu_Selection (Selection : out Integer) is 
   begin
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      loop
	 Put("Val: ");
	 Get(Selection);
	 exit when (Selection in 1..4);
	 Put_Line("Felaktigt val!");
      end loop; 
   end Menu_Selection;
   
   Selection : Integer;
   
begin
   
   Put_Line("Välkommen till miniräknaren!");
   Menu_Selection(Selection);
   loop
      case Selection is 
	 when 1 =>
	    Hypothenuse_Program;
	    Menu_Selection(Selection);
	 when 2 =>
	    Angle_Program;
	    Menu_Selection(Selection);
	 when 3 =>
	    Factorial_Program;
	    Menu_Selection(Selection);
	 when 4 =>
	    Put_Line("Ha en bra dag!");
	    exit;
	 when others => 
	    Put_Line("Error!");
	    exit;
      end case;
   end loop;
end Program;

