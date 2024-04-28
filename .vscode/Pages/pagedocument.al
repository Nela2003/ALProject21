page 50100 "NonConformity Rep"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "NonConformance Doc Table";
    Caption = 'Nonconformance Quality Report';

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                Caption = 'No.';
                ApplicationArea = all;

            }
            group(General)
            {
                field("Type of nonconformity"; Rec."Type of nonconformity")
                {
                    ApplicationArea = all;
                }
                field("CAQS Employee No."; Rec."CAQS Employee No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate();
                    var
                        Employee1: record Employee;
                    begin
                        Employee1.SetRange("No.", Rec."CAQS Employee No.");
                        if Employee1.FindFirst() then begin
                            Vlera := Employee1."Search Name";

                        end;
                        Rec.Validate("CAQS Employee", Vlera);

                    end;
                }
                field("CAQS Employee"; Rec."CAQS Employee")
                {
                    ApplicationArea = all;




                }
                field("Nonconformity Reason"; Rec."Nonconformity Reason")
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;

                    Editable = Vlbool2;
                    trigger OnValidate();
                    begin

                        // Rec.Validate("Posting Date",Rec."Creation Date");


                        vlbool2 := false;
                    end;



                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Applicationarea = all;
                    Visible = false;
                    trigger OnValidate();
                    begin

                        Rec."Creation Date" := System.WorkDate();
                        //    dt:=Rec."Creation Date";

                        Rec.Validate(Rec."Posting Date", Rec."Creation Date");
                    end;

                }
            }
            // part("Responsible Part";"Responsible Employee Cardpart"){
            //     ApplicationArea=all;
            // }
            group("Nonconformity Details")
            {
                field("Item No."; Rec."Item No.")
                {    TableRelation=Item."No.";
                    ApplicationArea = all;
                  ////////////////


                     trigger OnValidate();
                    var
                        Item: record Item;
                    begin
                        Item.SetRange("No.", Rec."Item No.");
                        if Item.FindFirst() then begin
                            description := Item.Description;

                        end;
                        Rec.Validate("Description", description);

                    end;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Nonconformity Description"; Rec."Nonconformity Description")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Lot; Rec.Lot)
                {
                    ApplicationArea = all;
                }
            }
            group("Corrective/Preventive Action")
            {
                field("Proposal for corrective or preventive action"; Rec."Proposal for corrective or preventive action")
                {
                    ApplicationArea = all;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = all;
                }
                field(Penalty; Rec.Penalty)
                {
                    ApplicationArea = all;
                }
                field("Actions taken"; Rec."Actions taken")
                {
                    ApplicationArea = all;
                }

            }
            group(Closed)
            {
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    var
                        dt1:date;
                    begin
                      
                        if ((Rec.Status=Rec.Status::Closed)and (XRec.Status=xRec.Status::Open)) then begin 
                            vlbool2:=false;
                          dt1:=System.Today();
                          Rec.Validate("Closing NonConformity Date",dt1);
                        
                        end
                         else  if ((Rec.Status=Rec.Status::Open) and (XRec.Status=xRec.Status::Closed)   ) then begin
                                vlbool2:=true;
                                dt1:=0D;
                                Rec.Validate("Closing NonConformity Date",dt1);
                            
                                Rec.Modify();
                             end;
                            end;
                          

                       
                    
                }
                field("Closing NonConformity Date"; Rec."Closing NonConformity Date")
                {
                    ApplicationArea = all;

                   
                    
                    Editable = Vlbool2;
                    trigger OnValidate();
                    begin
                        
                
                        // Rec.Validate("Posting Date",Rec."Creation Date");

                    // if Rec.Status=Rec.Status::Closed then begin
                    //      Rec."Closing NonConformity Date":=System.Today();
                    //    if Rec.Status=Rec.Status::Closed then   vlbool2 := false
                    //      else vlbool2:=true;


                        //   if Rec.Status=Rec.Status::Closed then begin 
                        //     Vlbool2:=false;
                            
                        //   end;
                        //   if ((xRec.Status=xRec.Status::Closed) and  (Rec.Status=Rec.Status::Open))
                        //   then Vlbool2:=true; 

                    //     if ((XRec.Status=xRec.Status::Open) and (Rec.Status=Rec.Status::Closed)) then begin 
                    //         clear(Vlbool2);
                    //         vlbool2:=false;
                    //     end

                    //    else   if ((XRec.Status=xRec.Status::Closed) and (Rec.Status=Rec.Status::Open)) then begin 
                    //         clear(Vlbool2);
                    //         vlbool2:=true;
                            
                    //     end
                       
                    //    else Vlbool2:=true;
                       
                    //     Rec.Modify();
                    // end
                    //  if Rec.Status<>Rec.Status::Closed then  begin 
                    //      Vlbool2:=true;
                    //     Rec."Closing NonConformity Date":=0D;
                    //     Rec.Modify(); 


                    // if Rec.Status<>xRec.Status then begin 
                    //     if Rec.Status=Rec.Status::Open then begin 
                    //         Vlbool2:=true;
                    //         Rec."Closing NonConformity Date":=0D;
                    //         Rec.Modify();
                    //     end
                    // end
                    
                    end;
                    // end;
                }
            }

            field("Company Name"; Rec."Company Name")
            {
                ApplicationArea = all;
            }
            field("Company's Email"; Rec."Company's Email")
            {
                ApplicationArea = all;
            }
            field("Company Phone No."; Rec."Company Phone No.")
            {
                ApplicationArea = all;
            }

            part("Report Lines"; "Report List ")
            {
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("&Responsible Employee")
            {
                Image = Action;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = all;


                RunObject = Page "Responsible Employee";
                ToolTip = 'Responsible Employee of the nonconformity';
            }
            action("&Print")
            {

                Image = Print;
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;

                //     trigger OnAction();
                //     var Report:Report "Nonconformance Report";

                //     begin
                //    Report.Run();
                //      end;
                RunObject = Report "Nonconformance Report";
            }
            action("Open in Excel")
            {
                Image = Open;
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var 
                begin
              ExportReport(Rec);
                end;

            }

        }

    }

    var
        myInt: Integer;
        Vlera: Code[250];
        Vlbool2: boolean;
        dt: date;
        description:text[100];
    // trigger OnAfterGetRecord();
    //     begin 


    //     Vlbool2:=Editable;

    //    if Rec."Posting Date"<>0D then begin
    //        vlbool2:=false;
    //    end;
    //    Editable:=Vlbool2;

    //     end;
    trigger OnAfterGetRecord();
    var
        CompanyInfo: Record "Company Information";
    begin
        Rec."Creation Date" := System.WorkDate();
        //    dt:=Rec."Creation Date";

        Rec.Validate(Rec."Posting Date", Rec."Creation Date");

        ///
        CompanyInfo.SetRange("Name", 'CRONUS International Ltd.');
        if CompanyInfo.FindFirst() then begin
            Rec."Company Name" := CompanyInfo.Name;
            Rec."Company's Email" := CompanyInfo."E-Mail";
            Rec."Company Phone No." := CompanyInfo."Phone No.";
        end;
    end;



    ///////
    procedure ExportReport(var ReportRec :Record  "NonConformance Doc Table")
var TempExcelBuffer:Record "Excel Buffer" temporary;
     Reportlbl: label 'Report NonConformance';
      ExcelFileName: label 'Report Nonconformance_%1_%2';
       begin 
   TempExcelBuffer.Reset();
    TempExcelBuffer.DeleteAll();
     TempExcelBuffer.NewRow();
      TempExcelBuffer.AddColumn(ReportRec.FieldCaption("CAQS Employee"),false,'',false,false,false,'',TempExcelBuffer."Cell Type"::Text  );
       ReportRec.SetRange("No.",Rec."No.");
      if ReportRec.FindSet() then  begin repeat 
TempExcelBuffer.NewRow();
TempExcelBuffer.AddColumn(ReportRec."CAQS Employee",false,'',false,false,false,'',TempExcelBuffer."Cell Type"::Text);
until ReportRec.Next()=0;
      end;

      TempExcelBuffer.CreateNewBook(Reportlbl);
      TempExcelBuffer.WriteSheet(Reportlbl,CompanyName,UserId);
      TempExcelBuffer.CloseBook();
      TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName,CurrentDateTime,UserId));
      TempExcelBuffer.OpenExcel();
    
       end;
}