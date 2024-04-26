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

            
        }
        dataitem("Company Information";"Company Information"){
            column("Company_Name";"Name"){
                IncludeCaption=true;
            }
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
        

}