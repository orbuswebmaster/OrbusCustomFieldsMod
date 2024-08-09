pageextension 50107 UserSetupPageEx extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Allow Posting To")
        {
            field(AllowRelease; Rec.AllowRelease)
            {
                ApplicationArea = All;
                Caption = 'Allow Release and Reopen';
                ToolTip = 'When this boolean field is marked to true, then users are able to release and reopen sales orders';
            }
            field("Can Modify Industry Dimension"; Rec."Can Modify Industry Dimension")
            {
                ApplicationArea = All;
            }
            field("International Visible"; Rec."International Visible")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                begin
                    if Rec."International Visible" = true then begin
                        if Dialog.Confirm('This will allow users to see "International" table field for customer records. Is this what you want to do?', true)then exit
                        else
                        begin
                            Rec."International Visible":=xRec."International Visible";
                            Rec.Modify();
                        end;
                    end;
                end;
            }
        }
    }
    var myInt: Integer;
}
