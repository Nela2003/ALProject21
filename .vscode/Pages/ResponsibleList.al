page 50105 "Responsible Employee"
{
    Caption = 'PageName';
    PageType = List;
    CardPageId="Responsible Employee Cardpart";
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Responsible Employee table";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";Rec."No."){
                    ApplicationArea=all;
                }
                field(Employee;Rec.Employee){
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
                
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
}