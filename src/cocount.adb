with Ada.Text_IO; use Ada.Text_IO;
with Account.Default_Account; use Account.Default_Account;
With Account.Vector; use Account.Vector;

package body Cocount is

    procedure Main is
        DA: Account.Default_Account.Instance;
        AS: Account.Vector.Account_Stack;
    begin
        -- Set_Name(DA, "tom");
        DA.Set_Name("Tom");
        Add(AS, DA);
        Put_Line("Cocount..." & Name(DA) & " , " & AS.Length'Image);
        Put_Line("Delete...");
        Delete(AS, DA);
        AS.Delete(0); -- OK
        Put_Line("Cocount..." & Name(DA) & " , " & AS.Length'Image);
    end Main;


end Cocount;
