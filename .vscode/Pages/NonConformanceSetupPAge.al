page 50103 "NonConformance Setup"
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 5 - Lab 2-3
{
 PageType = Card;
 SourceTable ="Nonconformance Setup" ;
 Caption='Nonconformance Setup';
 InsertAllowed = false;
 DeleteAllowed = false;
 UsageCategory = Administration;
 layout
 {
 area(content)
 {
 group(Numbering)
 {
 field("Nonconformance Nos.";Rec."Nonconformance Nos."){

 }
 field("Posting Nonconformance Nos.";Rec."Posting Nonconformance Nos."){
    
 }
 }
 }
 }
 
 trigger OnOpenPage();
 begin
 if not Rec.get then begin
 Rec.init;
 Rec.insert;
 end;
 end;
}