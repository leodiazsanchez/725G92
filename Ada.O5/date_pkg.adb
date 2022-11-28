-- leodi727: Arbetat enskilt

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Date_Pkg is
   
   type Days is array (1 .. 12) of Integer;
   
   Day_Arr : constant Days := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
   
   function Check_Leap_Year (Year : in Integer) return Boolean is
   begin
      
      if ((Year mod 4 = 0 and (not (Year mod 100 = 0))) or Year mod 400 = 0) then
         return True;
      end if;
      return False;
      
   end Check_Leap_Year;
   
   function Days_In_Month (Year,Month : in Integer) return Integer is
   begin
      if Check_Leap_Year(Year) and Month = 2 then
	 return  29;
      else 
	 return Day_Arr(Month);
      end if;
   end;
   
   procedure Input (Item : out String; 
		    Index : out Integer) is
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

   procedure Length_Check (Item : in String; 
			   Counter : in Integer) is
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
   
   function Next_Date(Date : in  Date_Type) 
		     return Date_Type is
      Date_Out : Date_Type;
   begin
      Date_Out := Date;
      
      if Date.Day < Days_In_Month(Date.Year,Date.Month) then
	 Date_Out.Day := Date.Day + 1;
	 
      elsif Date.Day = Days_In_Month(Date.Year,Date.Month) and Date.Month < 12 then
	 Date_Out.Day := 1;
	 Date_Out.Month := Date.Month + 1;
	 
      else 
	 Date_Out.Day := 1;
	 Date_Out.Month := 1;
	 Date_Out.Year := Date.Year + 1;
      end if;
      
      return Date_Out;
   end;
   
   function Previous_Date(Date : in Date_Type) 
			 return Date_Type is
      Date_Out : Date_Type;
      
   begin
      
      Date_Out := Date;
      
      if Date.Day > 2 then
	 Date_Out.Day := Date.Day - 1;
	 
      elsif Date.Day = 1 and Date.Month > 2 then
	 Date_Out.Month := Date.Month - 1;
	 Date_Out.Day := Days_In_Month(Date.Year,Date_Out.Month);
	 
      elsif Date.Day = 1 and  Date.Month = 1 then
	 
	 if Date_Out.Month /= 1 then
	    Date_Out.Month := Days_In_Month(Date.Year,Date.Month-1);
	    Date_Out.Year := Date.Year - 1;
	 else
	    Date_Out.Month := 12;
	    Date_Out.Day := Day_Arr(12);
	    Date_Out.Year := Date.Year - 1;
	 end if;
	 
      end if;
      return Date_Out;
   end;
   
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



   procedure Validity_Check (Item : in Date_Type) is
   begin
      
      if Item.Year not in 1_532 .. 9_000 then
         raise Year_Error;
	 
      elsif Item.Month not in 1 .. 12 then
         raise Month_Error;
      end if;
      if Item.Day not in 1 .. Days_In_Month(Item.Year,Item.Month) then
         raise Day_Error;
      end if;
      
   end Validity_Check;
   
   procedure Get(Date : out Date_Type) is
      Date_Str : String(1..10);
   begin
      Get (Date_Str);
      Format_Check (Date_Str);
      Date.Year  := Integer'Value (Date_Str (1 .. 4));
      Date.Month := Integer'Value (Date_Str (6 .. 7));
      Date.Day   := Integer'Value (Date_Str (9 .. 10));
      Validity_Check (Date);
   end;
   
   procedure Put (Date : in Date_Type) is
      type Date_Elements is array (1 .. 3) of Integer;
      Date_E : Date_Elements;
   begin
      Date_E := (Date.Year, Date.Month, Date.Day);
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
   
   
   function "="(Date1, Date2 : in Date_Type) 
	       return Boolean is
   begin
      
      if Date1.Year = Date2.Year and Date1.Month = Date2.Month and Date1.Day = Date2.Day then
	 return True;
      end if;
      
      return False;
   end;
     
   function "<"(Date1, Date2 : in Date_Type) 
	       return Boolean is
   begin
       if Date1.Year < Date2.Year then
	 return True;
	 
      elsif Date1.Year = Date2.Year then
	 
	 if Date1.Month < Date2.Month then
	    return True;
	    
	 elsif Date1.Month = Date2.Month then
	    
	    if Date1.Day < Date2.Day then
	       return True;
	       
	    end if;
	    
	    return False;
	    
	 end if;
	 
      end if;
      
      return False;
   end; 
   
   function ">"(Date1, Date2 : in Date_Type) 
	       return Boolean is
   begin
      if Date1 = Date2 then
	 return False;
      end if;
      return not (Date1 < Date2);
   end;
   
end;
