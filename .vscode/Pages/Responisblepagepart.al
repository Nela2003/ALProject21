page 50104 "Responsible Employee Cardpart"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Responsible Employee table";
    
    layout
    {
        area(Content)
        {
           group("Responsible Employee"){
            field("No.";Rec."No."){
                 ApplicationArea=all;
                 LookupPageId="Employee List";
                 DrillDownPageId="Employee List";
                  trigger OnValidate();
             var Employee1:record Employee;
             Vlera:code[250];
 begin
     Employee1.SetRange("No.",Rec."No.");
      if Employee1.FindFirst()then begin
    Vlera:=Employee1."Search Name";
    
 end;
Rec.Validate("Employee",Vlera);
  
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
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}