page 50101 "Responsible Employee"
{
    Caption = 'Responsible Employee';
    PageType = List;
    DataCaptionFields="No..";
  
   

    AutoSplitKey=false;
   MultipleNewLines=true;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Responsible Employee" ;
    
    
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
               
                field("Report No.";Rec."No.."){
                   visible=false;
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


     trigger OnNewRecord(BelowxRec:Boolean)
 var
    myInt: Integer;
 begin
    Rec.SetupNewLine;
 end;




}