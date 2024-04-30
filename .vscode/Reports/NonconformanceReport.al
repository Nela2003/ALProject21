report 50100 "Nonconformance Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = './Layouts/SeminarRegParticipantList.rdl';
    DefaultLayout=RDLC;
   RDLCLayout='.vscode\Layouts\NonconformanceReport.rdl';
    Caption='Nonconformance Report';
    
    
    dataset
    {
        dataitem("NonConformance Doc Table";"NonConformance Doc Table")
        {  DataItemTableView=sorting("No.");
          RequestFilterFields="No.","CAQS Employee";
           column("No_"; "No.")
            {
              IncludeCaption=true;  
            }
             column(CAQS_Employee;"CAQS Employee"){
                IncludeCaption=true;
             }
             column(CAQS_Employee_No_;"CAQS Employee No."){
                   IncludeCaption=true;
             }
             column(Closing_NonConformity_Date;"Closing NonConformity Date"){
                        IncludeCaption=true;
             }
             column(Creation_Date;"Creation Date"){
                    IncludeCaption=true;
             }
             column(Actions_taken;"Actions taken"){
                  IncludeCaption=true;
             }
             column(Comments;Comments){
                  IncludeCaption=true;
             }
             column(Description;Description){
                  IncludeCaption=true;
             }
             column(Item_No_;"Item No."){
                 IncludeCaption=true;
             }
             column(Lot;Lot){
                  IncludeCaption=true;
             }
             column(Nonconformity_Description;"Nonconformity Description"){
                    IncludeCaption=true;
             }
             column(Type_of_nonconformity;"Type of nonconformity"){
                 IncludeCaption=true;
             }
             column(Posting_Date;"Posting Date"){
                IncludeCaption=true;
             }
             column(Nonconformity_Reason;"Nonconformity Reason"){
                IncludeCaption=true;
             }
           column(Penalty;Penalty){
               IncludeCaption=true;
           }
           column(Proposal_for_corrective_or_preventive_action;"Proposal for corrective or preventive action"){
                IncludeCaption=true;
           }
           column(Company_Name;"Company Name"){
           IncludeCaption=true;
        

           }
           column(Company_s_Email;"Company's Email"){
                IncludeCaption=true;
           }
           column(Company_Phone_No_;"Company Phone No."){
                 IncludeCaption=true;
           }
           column(Picture;Picture){
            IncludeCaption=true;
           }
           column(Quantity;Quantity){
            IncludeCaption=true;
           }
             dataitem("Responsible Employee table";"Responsible Employee table"){
                DataItemTableView=sorting("No.");
              DataItemLink= "Report No."=field("No."); 
              column(EmployeeNo;"No."){
                   IncludeCaption=true;
              }
              column(Employee;Employee){
                IncludeCaption=true;
              }
            
trigger OnAfterGetRecord()
var
    
begin
     
           Responsibletable.SetRange("Report No.",Nr);
                    If Responsibletable.FindSet() then begin  repeat
                       
                       "Responsible Employee table"."No.":=Responsibletable."No.";
                       "Responsible Employee table".Employee:=Responsibletable.Employee;
                            "Responsible Employee table".Insert(true);
              
                    until Responsibletable.Next()=0;
                    
                    
                  
                    
           end;           

                        

                        
                       
end;

           }
           trigger OnAfterGetRecord();
                
                  var CompInfo:Record "Company Information";
                      Test:Record "Employee test";
                      NonConformance:Record "NonConformance Doc Table";
           begin 
CompInfo.SetRange(Name,'CRONUS International Ltd.');
IF CompInfo.FindFirst() then begin 
    "NonConformance Doc Table"."Company Name":=CompInfo.Name;
    "NonConformance Doc Table"."Company Phone No.":=CompInfo."Phone No.";
    CompInfo.CalcFields(Picture);
    "NonConformance Doc Table".Picture :=CompInfo.Picture;
 
end;
   NonConformance.SetRange("No.","NonConformance Doc Table"."No.");
   if NonConformance.FindFirst() then begin 
          Nr:="NonConformance Doc Table"."No."

        end;
     
           end;
      
           
      
           }
    }
    
    
    requestpage
    {
        layout
        {
            area(Content)
            {  
                group(GroupName)
                {
                    
                }
               label("NonConformance Report"){
                Caption='NonConformance Report';
               }
      
            }

             
        
            }
            
       
            }
        
    
       
    
    
    //rendering
    //{
       // layout(LayoutName)
       // {
            //Type = Excel;
            //LayoutFile = 'mySpreadsheet.xlsx';
       // }
   // }
    
    var
   
        Responsibletable:Record "Responsible Employee table";
        Nr:code[20];
 CompInfo:Record "Company Information";
}