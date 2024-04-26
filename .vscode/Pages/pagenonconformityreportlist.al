page 50102 "Report List "
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption='Report List';
    SourceTable = "NonConformance Doc Table";
    
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
            }
        }
        // area(Factboxes)
        // {
            
        // }
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