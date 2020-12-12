with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Account.Default_Account is
    type Instance is tagged private;
    type Instance_Ref is access Instance;

    procedure Set_Name(Item: in out Instance;
                       N: in String);

    function Name(Item: in Instance) return String;

    procedure Set_Site(Item: in out Instance;
                       S: in String);

    function Site(Item: in Instance) return String;

    procedure Set_Account_Name(Item: in out Instance;
                       AN: in String);

    function Account_Name(Item: in Instance) return String;

    procedure Set_Password(Item: in out Instance;
                       P: in String);

    function Password(Item: in Instance) return String;

    procedure Set_Desc(Item: in out Instance;
                       D: in String);

    function Desc(Item: in Instance) return String;
private
    type Instance is tagged record
        Name: Unbounded_String;
        Site: Unbounded_String;
        Acc: Unbounded_String;
        Password: Unbounded_String;
        Desc: Unbounded_String;
    end record;
end Account.Default_Account;
