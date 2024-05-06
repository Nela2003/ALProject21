page 50103 "NonConformance Setup"

{
 PageType = Card;
 SourceTable ="Nonconformance Setup" ;
 Caption='Nonconformance Setup';
 InsertAllowed = false;
 DeleteAllowed = false;
 UsageCategory = Administration;
 ApplicationArea=all;
 layout
 {
 area(content)
 {
 group(Numbering)
 {
 field("Nonconformance Nos.";Rec."Nonconformance Nos."){
   ApplicationArea=all;
 }
 field("Posting Nonconformance Nos.";Rec."Posting Nonconformance Nos."){
    ApplicationArea=all;
 }
 }
 }
 }
 
 trigger OnOpenPage();
 begin
 if not Rec.get then begin
 Rec.init;
 Rec.insert;
 Rec.Modify();
 end;
 end;
}