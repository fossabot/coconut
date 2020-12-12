package body Account.Vector is

    procedure Add(Item: in out Account_Stack; C: in Default_Account.Instance) is
    begin
        Item.Append(C);
    end Add;

    procedure Delete(Item: in out Account_Stack; C: in Default_Account.Instance) is
    begin
        Item.Delete(Item.Find_Index(C));
    end Delete;

    procedure Delete(Item: in out Account_Stack; I: Integer) is
    begin
        Item.Delete(I);
    end Delete;

end Account.Vector;
