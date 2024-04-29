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
              trigger OnPreDataItem();
              var Responsibletemp:Record "Responsible Employee table" temporary;
              begin 
Responsibletemp.SetRange("Report No.","NonConformance Doc Table"."No.");
if Responsibletemp.FindFirst() then begin repeat
"Responsible Employee table"."No.":=Responsibletemp."No.";
"Responsible Employee table".Employee:=Responsibletemp.Employee;
       until Responsibletemp.Next()=0;  
end;
              end;
              
           }
           trigger OnAfterGetRecord();
                   var emri:Text[100];
                   CompInfo:Record "Company Information";
           begin 
CompInfo.SetRange(Name,'CRONUS International Ltd.');
IF CompInfo.FindFirst() then begin 
    "NonConformance Doc Table"."Company Name":=CompInfo.Name;
    "NonConformance Doc Table"."Company Phone No.":=CompInfo."Phone No.";
    "NonConformance Doc Table".Picture :=CompInfo.Picture;
    
end;
           end;


      
           }
        //    column(Company_Name;"Company Name"){
        //      IncludeCaption=true;
        //    }
        //    column(Company_Phone_No_;"Company Phone No."){
        //      IncludeCaption=true;
        //    }
        //    column(Company_s_Email;"Company's Email"){
        //       IncludeCaption=true;
        //    }
        //////////////////
        // dataitem("Company Information";"Company Information"){
        //     // column(){
        //     //     IncludeCaption=true;
             
        //     // }
        //     column(Name;Name){
        //        IncludeCaption=true; 
        //     }
        //     column(Phone_No_;"Phone No."){
        //      IncludeCaption=true; 
        //     }
        //     column(Address;Address){
        //       IncludeCaption=true;
        //     }
        //     column(E_Mail;"E-Mail"){
        //        IncludeCaption=true;
        //     }
        //     column(Picture;Picture){
        //       IncludeCaption=true;
        //     }  }
            
        }
        // dataitem("Company Information";"Company Information"){
        //     column("Company_Name";Name2){
             
        //     }
        //     column(Phone_No_;"Phone No."){
        //      IncludeCaption=true; 
        //     }
        //     column(Address;Address){
        //       IncludeCaption=true;
        //     }
        //     column(E_Mail;"E-Mail"){
        //        IncludeCaption=true;
        //     }
        //     column(Picture;CompanyInformationn.Picture){
        //       IncludeCaption=true;
        //     }  
//             trigger OnPreDataItem();
//     begin 
//         "Company Information".SetRange("Name",'CRONUS International Ltd.');
//         if "Company Information".FindFirst() then 
//         Name2:="Company Information".Name;
//     //     // // "Company Information".Get('CRONUS International Ltd.');
//     //     CompanyInformationn.Name:="Company Information".Name;


// // CompanyInformationn.SetRange("Name",'CRONUS International Ltd.');
// //         if CompanyInformationn.FindFirst() then begin
     
// //         "Company Information".Name:=CompanyInformationn."Name";
// //         "Company Information"."E-Mail":= CompanyInformationn."E-Mail";
// //         "Company Information"."Phone No.":= CompanyInformationn."Phone No.";


//         end;
    // end;
    
    
    requestpage
    {
        layout
        {
            area(Content)
            {  
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;
                        
                    // }
                }
               label("NonConformance Report"){
                Caption='NonConformance Report';
               }
      
            }

             
        
            }
            
       
            }
        
    
        // actions
        // {
        //     area(processing)
        //     {
        //         action(ActionName)
        //         {
        //             ApplicationArea = All;
                    
        //         }
        //     }
        // }
    
    
    //rendering
    //{
       // layout(LayoutName)
       // {
            //Type = Excel;
            //LayoutFile = 'mySpreadsheet.xlsx';
       // }
   // }
    
    var
        myInt: Integer;

    //    trigger OnPreReport()
    //    var CompanyInfo:Record "Company Information";
    //     myInt: Integer;
    //    begin
    //      CompanyInfo.Get();
         

    //    end; 
    // trigger OnInitReport();
    // var CompanyInfo:Record "Company Information";
    //      NonConformancetab:Record "NonConformance Doc Table";
    // begin
        

      
    //     ///
    //     CompanyInfo.SetRange("Name",'CRONUS International Ltd.');
    //     if CompanyInfo.FindFirst() then begin
    //     "NonConformance Doc Table"."Company Name":=CompanyInfo.Name;
    //     NonConformancetab."Company's Email":=CompanyInfo."E-Mail";
    //     NonConformancetab."Company Phone No.":=CompanyInfo."Phone No.";
        
    //     end;
    // end;
  
//     //     "Company Information".SetRange("Name",'CRONUS International Ltd.');
//     //     if "Company Information".FindFirst() then 
//     //     // // "Company Information".Get('CRONUS International Ltd.');
//     //     CompanyInformationn.Name:="Company Information".Name;


// CompanyInformationn.SetRange("Name",'CRONUS International Ltd.');
//         if CompanyInformationn.FindFirst() then begin
     
//         "Company Information".Name:=CompanyInformationn."Name";
//         "Company Information"."E-Mail":= CompanyInformationn."E-Mail";
//         "Company Information"."Phone No.":= CompanyInformationn."Phone No.";

//         end;


trigger OnPreReport()
// var CompInfo:Record "Company Information";
//              emri:Text[100];
           begin 
CompInfo.SetRange(Name,'CRONUS International Ltd.');
IF CompInfo.FindFirst() then begin 
    "NonConformance Doc Table"."Company Name":=CompInfo.Name;
    "NonConformance Doc Table"."Company Phone No.":=CompInfo."Phone No.";
    
end;
           end;
  

var CompanyInformationn:Record  "Company Information";
Name2:text[100];
emri:text[100];
 CompInfo:Record "Company Information";
}