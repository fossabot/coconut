package body Account.Default_Account is

   procedure Set_Name(Item: in out Instance;
                       N: in String) is
    begin
        Item.Name := Ada.Strings.Unbounded.To_Unbounded_String(N);
    end Set_Name;

    function Name(Item: in Instance) return String is
    begin
        return Ada.Strings.Unbounded.To_String(Item.Name);
    end Name;

    procedure Set_Site(Item: in out Instance;
                       S: in String) is
    begin
        Item.Site := Ada.Strings.Unbounded.To_Unbounded_String(S);
    end Set_Site;

    function Site(Item: in Instance) return String is
    begin
        return Ada.Strings.Unbounded.To_String(Item.Site);
    end Site;

    procedure Set_Account_Name(Item: in out Instance;
                               AN: in String) is
    begin
        Item.Acc := Ada.Strings.Unbounded.To_Unbounded_String(AN);
    end Set_Account_Name;

    function Account_Name(Item: in Instance) return String is
    begin
        return Ada.Strings.Unbounded.To_String(Item.Acc);
    end Account_Name;

    procedure Set_Password(Item: in out Instance;
                           P: in String) is
    begin
        Item.Password := Ada.Strings.Unbounded.To_Unbounded_String(P);
    end Set_Password;

    function Password(Item: in Instance) return String is
    begin
        return Ada.Strings.Unbounded.To_String(Item.Password);
    end Password;

    procedure Set_Desc(Item: in out Instance;
                       D: in String) is
    begin
        Item.Desc := Ada.Strings.Unbounded.To_Unbounded_String(D);
    end Set_Desc;

    function Desc(Item: in Instance) return String is
    begin
        return Ada.Strings.Unbounded.To_String(Item.Desc);
    end Desc;

end Account.Default_Account;
