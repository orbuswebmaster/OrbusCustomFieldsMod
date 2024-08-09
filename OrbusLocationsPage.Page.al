page 50101 OrbusLocationsPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = OrbusLocations;
    Caption = 'Orbus Locations';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Location; rec.OrbusLocation)
                {
                    ApplicationArea = All;
                }
                field(State; rec.OrbusState)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;
            }
        }
    }
    var myInt: Integer;
    trigger OnOpenPage()
    var
        OrbusLocation: Record OrbusLocations;
        var1: Enum StateOptions;
    begin
        OrbusLocation.Reset();
        OrbusLocation.SetRange(OrbusState, OrbusLocation.OrbusState::International);
        if OrbusLocation.FindFirst()then exit
        else
        begin
            OrbusLocation.Init();
            OrbusLocation.OrbusState:=OrbusLocation.OrbusState::International;
            var1:=OrbusLocation.OrbusState::International;
            OrbusLocation."Orbus State Text":=Format(var1, 0, '<Text>');
            OrbusLocation.OrbusLocation:='WR';
            OrbusLocation.Insert();
        end;
    end;
    procedure ProduceValues(): Text var
        OrbusLocation: Record OrbusLocations;
    begin
        OrbusLocation.Reset();
        CurrPage.SetSelectionFilter(OrbusLocation);
        if OrbusLocation.FindFirst()then exit(Format(OrbusLocation.OrbusState, 0, '<Text>'));
    end;
}
