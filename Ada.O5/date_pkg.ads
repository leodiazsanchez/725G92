-- leodi727: Arbetat enskilt

package Date_Pkg is
   
   type Date_Type is record
      Year, Month, Day : Integer;
   end record;
   
   Length_Error, Format_Error, Month_Error, Year_Error, Day_Error : exception;
   
   function Next_Date(Date : in  Date_Type) return Date_Type;
   
   function Previous_Date(Date : in Date_Type) return Date_Type;
   
   procedure Get(Date : out Date_Type);
   
   procedure Put(Date : in Date_Type);
   
   function "="(Date1, Date2 : in Date_Type) return Boolean; 
   
   function "<"(Date1, Date2 : in Date_Type) return Boolean; 
   
   function ">"(Date1, Date2 : in Date_Type) return Boolean; 
end;
