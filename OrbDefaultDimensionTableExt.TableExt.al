tableextension 50112 OrbDefaultDimensionTableExt extends "Default Dimension"
{
    fields
    {
        modify("Dimension Value Code")
        {
        trigger OnAfterValidate()
        var
            Customer: Record Customer;
        begin
            if Rec."Dimension Code" = 'CHANNEL' then begin
                Customer.Reset();
                Customer.SetRange("No.", Rec."No.");
                if Customer.FindFirst()then begin
                    Customer."Shortcut Dimension 5 Code":=Rec."Dimension Value Code";
                    Customer.Modify();
                end;
            end;
            if Rec."Dimension Code" = 'INDUSTRY' then begin
                Customer.Reset();
                Customer.SetRange("No.", Rec."No.");
                if Customer.FindFirst()then begin
                    Customer."Shortcut Dimension 6 Code":=Rec."Dimension Value Code";
                    Customer.Modify();
                end;
            end;
        end;
        }
    }
}
