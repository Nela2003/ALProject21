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
                {
                    ApplicationArea = all;
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
                }
                field("Closing NonConformity Date"; Rec."Closing NonConformity Date")
                {
                    ApplicationArea = all;
                }
            }

            field("Company Name";Rec."Company Name"){
              ApplicationArea = all;
            }
            field("Company's Email";Rec."Company's Email"){
               ApplicationArea = all;
            }
            field("Company Phone No.";Rec."Company Phone No."){
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


                RunObject = Page "Responsible Employee Cardpart";
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

        }

    }

    var
        myInt: Integer;
        Vlera: Code[250];
        Vlbool2: boolean;
        dt: date;
    // trigger OnAfterGetRecord();
    //     begin 


    //     Vlbool2:=Editable;

    //    if Rec."Posting Date"<>0D then begin
    //        vlbool2:=false;
    //    end;
    //    Editable:=Vlbool2;

    //     end;
    trigger OnAfterGetRecord();
    var CompanyInfo:Record "Company Information";
    begin
        Rec."Creation Date" := System.WorkDate();
        //    dt:=Rec."Creation Date";

        Rec.Validate(Rec."Posting Date", Rec."Creation Date");

        ///
        CompanyInfo.SetRange("Name",'CRONUS International Ltd.');
        if CompanyInfo.FindFirst() then begin
        Rec."Company Name":=CompanyInfo.Name;
        Rec."Company's Email":=CompanyInfo."E-Mail";
        Rec."Company Phone No.":=CompanyInfo."Phone No.";
        end;
    end;

}