page 50105 "Responsible Employee"
{
    Caption = 'PageName';
    PageType = List;
   

    AutoSplitKey=true;
   MultipleNewLines=true;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Employee test" ;
    
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";Rec."No."){
                    ApplicationArea=all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        Employee1: record Employee;
                    begin
                       Employee1.SetRange("No.", Rec."No.");
                        if Employee1.FindFirst() then begin
                            Vlera := Employee1."Search Name";

                        end;
                        Rec.Validate(Rec."Employee", Vlera); 
                    end;
                      

                }
                field(Employee;Rec.Employee){
                    ApplicationArea=all;
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
                
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
    var Vlera: Code[250];
}