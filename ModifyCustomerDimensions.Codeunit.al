codeunit 60115 ModifyCustomerDimensions
{
    Permissions = tabledata "Default Dimension"=RIMD;
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        Customer: Record Customer;
        DefaultDimension: Record "Default Dimension";
        var1: Text;
    begin
        var1:='';
        Customer.Reset();
        Customer.FilterGroup(-1);
        Customer.SetRange("Shortcut Dimension 5 Code", var1);
        Customer.SetRange("Shortcut Dimension 6 Code", var1);
        Customer.FilterGroup(0);
        if Customer.FindSet()then repeat DefaultDimension.Reset();
                DefaultDimension.SetRange("No.", Customer."No.");
                if DefaultDimension.FindSet()then repeat if DefaultDimension."Dimension Code" = 'CHANNEL' then begin
                            Customer."Shortcut Dimension 5 Code":=DefaultDimension."Dimension Value Code";
                            Customer.Modify();
                        end;
                        if DefaultDimension."Dimension Code" = 'INDUSTRY' then begin
                            Customer."Shortcut Dimension 6 Code":=DefaultDimension."Dimension Value Code";
                            Customer.Modify();
                        end;
                    until DefaultDimension.Next() = 0;
            until Customer.Next() = 0;
    end;
    procedure ModifyDefaultDimension5(var1: Text; var2: Text)
    var
        DefaultDimension: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Reset();
        if GLSetup.FindFirst()then begin
            DefaultDimension.Reset();
            DefaultDimension.SetRange("No.", var1);
            DefaultDimension.SetFilter("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
            if DefaultDimension.FindFirst()then begin
                DefaultDimension."Dimension Value Code":=var2;
                DefaultDimension.Modify();
            end
            else
            begin
                DefaultDimension.Init();
                DefaultDimension."Dimension Code":=GLSetup."Shortcut Dimension 5 Code";
                DefaultDimension."Dimension Value Code":=var2;
                DefaultDimension."No.":=var1;
                DefaultDimension."Table ID":=18;
                DefaultDimension."Parent Type":=DefaultDimension."Parent Type"::Customer;
                DefaultDimension.Insert();
            end;
        end;
    end;
    procedure ModifyDefaultDimension6(var1: Text; var2: Text)
    var
        DefaultDimension: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Reset();
        if GLSetup.FindFirst()then begin
            DefaultDimension.Reset();
            DefaultDimension.SetRange("No.", var1);
            DefaultDimension.SetFilter("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
            if DefaultDimension.FindFirst()then begin
                DefaultDimension."Dimension Value Code":=var2;
                DefaultDimension.Modify();
            end
            else
            begin
                DefaultDimension.Init();
                DefaultDimension."Dimension Code":=GLSetup."Shortcut Dimension 6 Code";
                DefaultDimension."Dimension Value Code":=var2;
                DefaultDimension."No.":=var1;
                DefaultDimension."Table ID":=18;
                DefaultDimension."Parent Type":=DefaultDimension."Parent Type"::Customer;
                DefaultDimension.Insert();
            end;
        end;
    end;
}
