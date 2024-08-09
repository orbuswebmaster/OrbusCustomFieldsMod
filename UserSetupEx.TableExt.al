tableextension 50103 UserSetupEx extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50103; AllowRelease; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Can Modify Industry Dimension"; Boolean)
        {
        }
        field(50105; "International Visible"; Boolean)
        {
        }
    }
    var myInt: Integer;
}
