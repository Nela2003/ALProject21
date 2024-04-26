table 50101 "NonConformance Doc Table"
{
    DataClassification = ToBeClassified;
     Caption='Nonconformance Doc table';
    
    fields
    { 
        field(1;"No."; Code[20])
        {  Caption='No.';
        // AutoIncrement=true;
   
        
         
          
        
            
        }
         field(2;"Type of nonconformity"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers=Product,Process,"Quality system";
        }
        field(3;"Nonconformity Reason"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers="Product advertising","Problems in production process","Scheduled check Random check","Non-execution of defined rules/standards";

        }

        field(4; "CAQS Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation="Employee"."No.";
//                   trigger OnValidate();
//              var Employee1:record Employee;
//  begin
//   Validate("CAQS Employee");
//  end;
        }
        field(17; "CAQS Employee";Code[250])
        {
            DataClassification = ToBeClassified;
//                         trigger OnValidate();
//              var Employee1:record Employee;
//  begin
//  Employee1.SetRange("No.","CAQS Employee No.");
//  if Employee1.FindFirst() then begin
//     Employee1."Search Name":="CAQS Employee";
//  end;
//  end;
            
         
        }
        field(5;"Posting Date"; Date)
        {   
            // Editable=true;
            
            // DataClassification = ToBeClassified;
            //  trigger OnValidate();
            //     begin
                 
            //         Rec.Validate("Posting Date",Today);
                   
            //     end;
                }
       

        
       
        field(6;"Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Quantity; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Lot; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Nonconformity Description"; Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Proposal for corrective or preventive action"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Comments;Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Penalty; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Actions taken"; Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers=Open,Closed;
        }
        field(16;"Closing NonConformity Date";Date){

        }
        field(18;"Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; "No.")
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
        vlbool:Boolean;
        NonConformanceSetup:record "Nonconformance Setup";
        // dt:date;
        NoseriesMgt:Codeunit NoSeriesManagement;
        Noseries:record "No. Series";
        
    
    trigger OnInsert()
    var Setup:Record "Nonconformance Setup";
    begin
      if "No."='' then begin 
        Setup.Get();
       "No.":=NoseriesMgt.GetNextNo(Setup."Nonconformance Nos.",WorkDate(),true);
      end;
      Rec."Creation Date":=System.WorkDate();
        //    dt:=Rec."Creation Date";

                Rec.Validate(Rec."Posting Date",Rec."Creation Date");
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
