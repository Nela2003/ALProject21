page 50101 "Employees List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Employee Table";
    Caption='Employee list';
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
             field("No.";Rec."No."){
                ApplicationArea=all;
             }
             field("First Name";Rec."First Name"){
                  ApplicationArea=all;
             }
             field("Last Name";Rec."Last Name"){
                ApplicationArea=all; 
             }
             field("Job Title";Rec."Job Title"){
                 ApplicationArea=all; 
             }
            }
        }
        area(Factboxes)
        {
            
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