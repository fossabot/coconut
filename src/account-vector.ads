with Account.Default_Account; use Account.Default_Account;

with Ada.Containers.Vectors;

package Account.Vector is

    package Account_Vector is new Ada.Containers.Vectors
      (Element_Type => Default_Account.Instance, Index_Type => Natural);
    use Account_Vector;

    subtype Account_Stack is Account_Vector.Vector;


    procedure Add(Item: in out Account_Stack; C: in Default_Account.Instance);

    procedure Delete(Item: in out Account_Stack; C: in Default_Account.Instance);

    procedure Delete(Item: in out Account_Stack; I: Integer);


end Account.Vector;
