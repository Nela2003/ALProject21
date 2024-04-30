table 50103 "Responsible Employee table"
{
    DataClassification = ToBeClassified;
    Caption='Responsible Employee';
    LookupPageId="Responsible Employee";
    DrillDownPageId="Responsible Employee";
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
        field(3;"Report No.";Code[20]){
                DataClassification = ToBeClassified; 
                // TableRelation="NonConformance Doc Table"."No.";
                // trigger OnValidate();
                // begin
                // //  Rec."Report No.":= NonConformance."No."; 
                // end;
        }
      field(4;"Line Nr";Integer){
        AutoIncrement=true;
      }
       
    }
    
    keys
    {
        key(Key1;"Line Nr")
        {
            Clustered = true;
        }
    }
    
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        // myInt: Integer;
        // NonConformance:Record "NonConformance Doc Table";
    
    // trigger OnInsert()
    // var Nonconformance:Record "NonConformance Doc Table";
    // begin
    //    Rec."Report No.":=Nonconformance."No." ;
    // end;
    
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