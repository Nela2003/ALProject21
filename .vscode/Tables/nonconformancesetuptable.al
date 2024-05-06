table 50102 "Nonconformance Setup"
{
    DataClassification = ToBeClassified;
   
    
   Caption = 'Nonconformance Setup';
 fields
 {
 field(10;"Primary Key";Code[10])
 {
 Caption = 'Primary Key';
 }
 
 field(20;"Nonconformance Nos.";Code[20])
 {
 Caption = 'Nonconformance Nos.';
 TableRelation = "No. Series";

 }
 field(30;"Posting Nonconformance Nos.";code[20])
 {
 Caption = 'Posting Nonconformance Nos.';
 TableRelation = "No. Series";
 }

 }
 keys
 {
 key(PK;"Primary Key")
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