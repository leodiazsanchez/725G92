-- leodi727: Arbetat enskilt


package Sorted_List is 
   
   type List_Type is private;
   
   No_Such_Element_Error : exception;
   
   function Empty(List : in List_Type) 
		 return Boolean;
   
   procedure Insert(List : in out List_Type; 
		    Num : in  Integer);
   
   procedure Put(List : in List_Type);
   
   function Member(List : in List_Type; 
		   Key : in Integer) 
		  return Boolean;
   
   procedure Remove (List : in out List_Type; 
		     Num : in Integer);
   
   procedure Delete (List : in out List_Type);
   
   function Length(List : in List_Type) 
		  return Natural;
   
private 
   type E_Type is 
      record
	 Num : Integer;
	 Next : List_Type;
      end record;
   
      type List_Type is 
     access E_Type;
    
end Sorted_List;

