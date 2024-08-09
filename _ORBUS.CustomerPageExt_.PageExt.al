pageextension 60304 "ORBUS.CustomerPageExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Needs Magento ID"; Rec."Needs Magento ID")
            {
                ApplicationArea = All;
            }
            field("Last Visit Date"; Rec."Last Visit Date")
            {
                ApplicationArea = All;
            }
        }
        addlast(PostingDetails)
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
                Editable = EditableVarIndustryDimesnion;
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
        modify(County)
        {
            trigger OnLookup(var Text: Text): Boolean var
                OrbusLocation: Record OrbusLocations;
                OrbusLocationList: page OrbusLocationsPage;
            begin
                OrbusLocationList.LookupMode(true);
                if OrbusLocationList.RunModal() = Action::LookupOK then begin
                    Rec.County:=OrbusLocationList.ProduceValues();
                    Rec.Modify();
                end;
            end;
        }
        addafter("E-Mail")
        {
            field(International; Rec.International)
            {
                ApplicationArea = All;
                Visible = InternationalVisibleVar;
            }
        }
    }
    var EditableVarIndustryDimesnion: Boolean;
    InternationalVisibleVar: Boolean;
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserId());
        if UserSetup.FindFirst()then begin
            if UserSetup."Can Modify Industry Dimension" = true then EditableVarIndustryDimesnion:=true
            else
                EditableVarIndustryDimesnion:=false;
            if UserSetup."International Visible" = true then InternationalVisibleVar:=true
            else
                InternationalVisibleVar:=false;
        end;
    end;
}
