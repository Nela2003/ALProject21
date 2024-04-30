page 50102 "Report List "
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption='Report List';
    SourceTable = "NonConformance Doc Table";
    CardPageId=50100;
  
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
               field("No.";Rec."No."){
                Applicationarea=all;
               }
               field("CAQS Employee";Rec."CAQS Employee"){
                ApplicationArea=all;
               }
               field("Actions taken";Rec."Actions taken"){
                  Applicationarea=all;
               }
               field("Closing NonConformity Date";Rec."Closing NonConformity Date"){
                  Applicationarea=all;
               }
               field(Comments;Rec.Comments){
                   Applicationarea=all;
               }
               field("Creation Date";Rec."Creation Date"){
                    Applicationarea=all;
               }
               field(Description;Rec.Description){
                    Applicationarea=all;
               }
               field("Item No.";Rec."Item No."){
                    Applicationarea=all;
               }
               field(Quantity;Rec.Quantity){
                     Applicationarea=all;
               }
               field("Nonconformity Description";Rec."Nonconformity Description"){
                     Applicationarea=all;
               }
               field("Nonconformity Reason";Rec."Nonconformity Reason"){
                        Applicationarea=all;
               }
               field(Status;Rec.Status){
                   Applicationarea=all;
               }
            }
        }
        
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
   
}