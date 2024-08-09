pageextension 60100 "ORBUS.SalesOrderSubformEXT" extends "Sales Order Subform"
{
    layout
    {
        addafter("Unit Price")
        {
            field("Hardware Price"; Rec."Hardware Price")
            {
                ApplicationArea = All;
            }
            field("Graphics Price"; Rec."Graphics Price")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.SetHardwareGraphicsPrice();
    end;
    var var1: Text;
}
