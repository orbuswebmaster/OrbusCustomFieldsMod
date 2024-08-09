codeunit 50127 ModifyCustomerInternational
{
    trigger OnRun()
    var
        Customer: Record Customer;
    begin
        Customer.Reset();
        if Customer.FindSet()then repeat if Customer."Country/Region Code" <> 'US' then begin
                    Customer.International:=Customer.International::"true";
                    Customer.Modify();
                end;
            until Customer.Next() = 0;
    end;
}
