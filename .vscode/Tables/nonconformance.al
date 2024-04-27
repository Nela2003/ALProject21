table 50103 "Responsible Employee table"
{
    DataClassification = ToBeClassified;
    Caption='Responsible Employee';
    LookupPageId="Employee List";
    DrillDownPageId="Employee List";
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=Employee."No.";
            
        }
        field(2;"Employee";Code[250])
        {
            DataClassification = ToBeClassified;

        }
    }
    
    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}