table 50100 "Employee Table"
{
    DataClassification = ToBeClassified;
    Caption='Employee table';
    LookupPageId="Employees List";
    DrillDownPageId="Employees List";

    
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
          field(2;"First Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            
        }
          field(3;"Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            
        }
          field(4;"Job Title"; Text[100])
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; "No.","First Name","Last Name")
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