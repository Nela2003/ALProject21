table  50104   "Responsible Employee"
{   
    DataClassification = ToBeClassified;
    DrillDownPageID=50101 ;
    LookupPageID=50101;
   

  fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=Employee."No.";
            ValidateTableRelation=false;
            
        }
       
        field(2;"Employee";Code[250]){

        }
        field(3;"No..";Code[20]){
            Caption='No..';
          
            TableRelation="NonConformance Doc Table"."No..";
            ValidateTableRelation=false;
        }
      
       
      
    }
    
    keys
    {
        key(Key1;"No.","No..")
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
        Nonconformance:Record "NonConformance Doc Table";
    
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



    procedure SetupNewLine()
var
 EmployeeLine: Record "Responsible Employee";

 begin

 EmployeeLine.SetRange("No..","No..");




        OnAfterSetUpNewLine(Rec, EmployeeLine);
    end;


 

  [IntegrationEvent(false, false)]
    local procedure OnAfterSetUpNewLine(var EmployeeLine: Record "Responsible Employee"; var EmployeeFilter: Record "Responsible Employee")
    begin
    end;
    
}