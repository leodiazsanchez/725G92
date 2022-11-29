-- leodi727: Arbetat enskilt
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

package body Sorted_List is 
   
   procedure Free is 
      new Ada.Unchecked_Deallocation(E_Type,List_Type);
   
   function Empty(List : in List_Type) return Boolean is
   begin
      
      if List = null then
	 return True;
      else
	 return False;
      end if;
      
   end;
   
   function Length(List : in List_Type) return Natural is
   begin

      if Empty(List) then
	 return 0;
      else
	 return 1 + Length(List.Next);
      end if;
      
   end;
   
   function Member(List : in List_Type; 
		   Key : in Integer) return Boolean is
   begin
      
      if Empty(List) then
	 return False;
      elsif List.Num = Key then
	 return True;
      else
	 return Member(List.Next,Key);
      end if;
      
   end;
   
   procedure Insert_Sorted(List,Element : in out List_Type) is
      Temp : List_Type;
   begin
      
      if Empty(List) then
	 List := Element;
      elsif Element.Num < List.Num then
	 Temp := List;
	 List := Element;
	 List.Next := Temp;
      elsif Element.Num /= List.Num then
	 Insert_Sorted(List.Next,Element);
      end if;
     
   end;
   
   procedure Delete(List : in out List_Type) is
   begin
      if not Empty(List) then
      	Delete(List.Next);
      	Free(List);
      end if;
   end;

   procedure Insert(List : in out List_Type;
		    Num : in Integer) is
      Temp : List_Type;
   begin     
      
      Temp := new E_Type;
      Temp.Num := Num;
      Insert_Sorted(List,Temp); 
      
   end;
   
   procedure Remove(List : in out List_Type; 
		    Num : in Integer) is
      Temp : List_Type;
   begin
      
      if Empty(List) then
	 raise No_Such_Element_Error;
      elsif List.Num = Num then
	 Temp := List.Next;
	 Free(List);
	 List := Temp;
      else
	 Remove(List.Next,Num);	 
      end if;
      
   end;   
   
   procedure Put(List : in List_Type) is
   begin
      
      if not Empty(List) then
	 Put(" ");
	 Put(List.Num, Width => 0);
	 Put(List.Next);
      end if;
      
   end;
   
end Sorted_List;
