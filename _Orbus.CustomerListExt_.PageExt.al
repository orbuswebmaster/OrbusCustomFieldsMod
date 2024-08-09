pageextension 60305 "Orbus.CustomerListExt" extends "Customer List"
{
    layout
    {
        addafter("Post Code")
        {
            field(ShipCity; Rec."Default Ship-to City")
            {
                ApplicationArea = All;
            }
        }
        addafter("Gen. Bus. Posting Group")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
            {
                ApplicationArea = All;
            }
        }
    }
/*actions
    {
        addafter("&Customer")
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Image = TestDatabase;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                ModifyCustomer: Codeunit ModifyCustomerDimensions;
                Customer: Record Customer;
                DefaultDimension: Record "Default Dimension";
                var1: Text;
                begin
                var1 := '';
                Customer.Reset();
                Customer.SetRange("Shortcut Dimension 5 Code", var1);
                    if
                    Customer.FindSet()
                    then
                    repeat
                        DefaultDimension.Reset();
                        DefaultDimension.SetRange("No.", Customer."No.");
                        DefaultDimension.SetFilter("Dimension Code", 'CHANNEL');
                        if
                        DefaultDimension.FindFirst()
                        then
                        begin
                            Customer."Shortcut Dimension 5 Code" := DefaultDimension."Dimension Value Code";
                            Customer.Modify();
                        end;
                    until
                    Customer.Next() = 0;
                end;
            }
        }
    }*/
}
