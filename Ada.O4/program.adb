-- leodi727: Arbetat enskilt

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
procedure program is

   type Date_Type is record
      Year, Month, Day : Integer;
   end record;

   type Date_Arr_Type is array (1 .. 5) of Date_Type;

   type Days is array (1 .. 12) of Integer;

   Length_Error, Format_Error, Month_Error, Year_Error, Day_Error : exception;

   -- Part 1

   procedure Get_Value_Safe (Min, Max : in Integer; Value : out Integer) is

   begin
      loop
         Put ("Mata in värde (");
         Put (Min, Width => 0);
         Put (" - ");
         Put (Max, Width => 0);
         Put ("): ");
         begin
            Get (Value);
            if Value < Min then
               Put ("För litet värde. ");
            elsif Value > Max then
               Put ("För stort värde. ");
            else
               exit;
            end if;
         exception
            when Data_Error =>
               Put ("Fel datatyp. ");
               Skip_Line;
         end;
      end loop;
   end Get_Value_Safe;

   procedure Part1 is
      Min, Max, Value : Integer;
   begin
      Put_Line ("Del 1:");
      Put ("Mata in Min och Max: ");
      Get (Min);
      Get (Max);
      Skip_Line;
      Get_Value_Safe (Min, Max, Value);
      Put ("Du matade in heltalet ");
      Put (Value, Width => 0);
      Put ('.');
      New_Line (2);
      Skip_Line;
   end Part1;

   -- Part 2

   procedure Input (Item : out String; Index : out Integer) is
      C       : Character;
      IsInput : Boolean := False;
   begin
      Index := Item'First;
      loop
         Get (C);
         if (End_Of_Line and IsInput) or Index = Item'Last then
            Item (Index) := C;
            exit;
         elsif C /= ' ' or IsInput then
            Item (Index) := C;
            IsInput      := True;
            Index        := Index + 1;
         end if;
      end loop;
   end Input;

   procedure Length_Check (Item : in String; Counter : in Integer) is
   begin
      if Counter < Item'Length then
         raise Length_Error;
      end if;
   end Length_Check;

   procedure Get (Item : out String) is
      Counter : Integer;
   begin
      Input (Item, Counter);
      Length_Check (Item, Counter);
   end Get;

   procedure Part2 is
      S_1 : String (1 .. 5);
      S_2 : String (2 .. 7);
      S_3 : String (1 .. 10);
   begin
      Put_Line ("Del 2:");
      Put ("Mata in en sträng på exakt 5 tecken: ");
      Get (S_1);
      Put_Line ("Du matade in " & S_1);
      Put ("Mata in en sträng på exakt 6 tecken: ");
      Get (S_2);
      Put_Line ("Du matade in " & S_2);
      Put ("Mata in en sträng på exakt 10 tecken: ");
      Get (S_3);
      Put ("Du matade in " & S_3);
      New_Line (2);
   end Part2;

   -- Part 3

   procedure Format_Check (Item : in String) is
   begin
      for I in Item'Range loop
         if I in 1 .. 4 or I in 6 .. 7 or I in 9 .. 10 then
            if not (Item (I) in '0' .. '9') then
               raise Format_Error;
            end if;
         elsif I = 5 or I = 8 then
            if not (Item (I) = '-') then
               raise Format_Error;
            end if;
         end if;
      end loop;
   end Format_Check;

   procedure Set_Leap_Year (Year : in Integer; Day_Arr : out Days) is
   begin
      if ((Year mod 4 = 0 and (not (Year mod 100 = 0))) or Year mod 400 = 0)
      then
         Day_Arr (2) := 29;
      end if;
   end Set_Leap_Year;

   procedure Validity_Check (Item : in Date_Type) is
      Day_Arr : Days := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
   begin
      if Item.Year not in 1_532 .. 9000 then
         raise Year_Error;
      elsif Item.Month not in 1 .. 12 then
         raise Month_Error;
      end if;
      Set_Leap_Year (Item.Year, Day_Arr);
      if Item.Day not in 1 .. (Day_Arr (Item.Month)) then
         raise Day_Error;
      end if;
   end Validity_Check;

   procedure Get (Item : out Date_Type) is
      Date_Str : String (1 .. 10);
   begin
      Get (Date_Str);
      Format_Check (Date_Str);
      Item.Year  := Integer'Value (Date_Str (1 .. 4));
      Item.Month := Integer'Value (Date_Str (6 .. 7));
      Item.Day   := Integer'Value (Date_Str (9 .. 10));
      Validity_Check (Item);
   end Get;

   procedure Put (Item : in Date_Type) is
      type Date_Elements is array (1 .. 3) of Integer;
      Date_E : Date_Elements;
   begin
      Date_E := (Item.Year, Item.Month, Item.Day);
      for I in Date_E'Range loop
         if I in 2 .. 3 and Date_E (I) < 10 then
            Put ("0");
         end if;

         Put (Date_E (I), Width => 0);

         if I /= Date_E'Last then
            Put ("-");
         end if;

      end loop;
   end Put;

   procedure Put_Dates (Dates : in Date_Arr_Type) is
   begin
      for I in Dates'Range loop
         Put ("Datum nummer ");
         Put (I, Width => 0);
         Put (": ");
         Put (Dates (I));
         New_Line;
      end loop;
   end Put_Dates;

   procedure Get_Dates (Dates : out Date_Arr_Type) is
   begin
      for I in Dates'Range loop
         loop
            Put ("Mata in datum ");
            Put (I, Width => 0);
            Put (": ");
            begin
               Get (Dates (I));
               exit;
            exception
               when Length_Error =>
                  Put ("Felaktigt format! ");
               when Format_Error =>
                  Put ("Felaktigt format! ");
               when Year_Error =>
                  Put ("Felaktigt år! ");
               when Month_Error =>
                  Put ("Felaktig månad! ");
               when Day_Error =>
                  Put ("Felaktig dag! ");
            end;
         end loop;
      end loop;
   end Get_Dates;

   procedure Part3 is
      Dates : Date_Arr_Type;
   begin
      Put_Line ("Del 3:");
      Get_Dates (Dates);
      Put_Dates (Dates);
   end Part3;

   -- Main program

begin

   Part1;
   begin
      Part2;
      Part3;
   exception
      when Length_Error =>
         Put_Line ("För få inmatade tecken!");
   end;

end program;
