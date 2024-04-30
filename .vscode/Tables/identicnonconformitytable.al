table 50104 "Employee test"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=Employee."No.";
            
        }
       
        field(2;"Employee";Code[250]){

        }
        field(3;"Report No.";Code[20]){

        }
        field(4;"Line Nr";Integer){

        }
    }
    
    keys
    {
        key(Key1; "Line Nr",Employee)
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