//
//  TimeSheetViewController.swift
//  Pierpont1
//
//  Created by Andrew Drogalis on 4/5/22.
//

import UIKit
import PDFKit
import MessageUI

class TimeSheetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UITextViewDelegate {
    var viewHeight: CGFloat = 0.0
    let title_page: String = "TIME SHEET"
    var Start_Name = ""
    var project_number_set = ""
    var date_set = ""
    var mechanic_name_set = ""
    var night_service_set = ""
    var notes_set = ""
    var selected_row_values: [Int] = [Int]()
    var job_type_values: [String] = [String]()
    var project_values: [String] = [String]()
    var manual_values: [String] = [String]()
    var Temp_Dict: [String:[String]] = [String:[String]]()
    let logo_image = UIImage(named: "pierpontlogowhiteback")
    // Array Init
    var Mechanic_Names: [String] = [String](); var Customer_Data: [String] = [String]()
    var Construction_Dict: [String:[String]] = [String:[String]]()
    var Maintenance_Dict: [String:[String]] = [String:[String]]()
    var Construction_DisplayName: [String] = [String]()
    var Maintenance_DisplayName: [String] = [String]()
    var data = Data()
    // Picker Views
    var pickerViewMechanic = UIPickerView(); var pickerViewMaintenance = UIPickerView(); var pickerViewConstruction = UIPickerView()
    var pickerViewSelectJob = UIPickerView()
    var selectedMainMechanic = 0
    var email_sent = 0
    var Reg_Hours = [Float](); var OT_Hours = [Float](); var DT_Hours = [Float]()
    var Reg_Hours_ = [String](); var OT_Hours_ = [String](); var DT_Hours_ = [String]()
    var selectedRow1 = 0
    var selectedRow2 = 0
    var selectedRow3 = 0
    var selectedRow4 = 0
    var selectedRow5 = 0
    var selectedRow6 = 0
    var selectedRow7 = 0
    var selectedRow8 = 0
    var selectedRow9 = 0
    var selectedRow10 = 0
    var selectedRow11 = 0
    var selectedRow12 = 0
    var selectedRow13 = 0
    var selectedRow14 = 0
    var selectedRow15 = 0
    var previous_orientation = ""; var current_orientation = ""
    // Header
    @IBOutlet weak var SelectMechanic: UIButton!
    @IBOutlet weak var SelectMechaniclabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var NightServicebutton: UIButton!
    // Body
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var NotesText: UITextView!
    @IBOutlet weak var RegHoursTotal: UILabel!
    @IBOutlet weak var OTHoursTotal: UILabel!
    @IBOutlet weak var DTHoursTotal: UILabel!
    @IBOutlet weak var ProjectNumberbutton: UIButton!
    @IBOutlet weak var NotesCalcTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var ManualText1: UITextField!
    @IBOutlet weak var ManualText2: UITextField!
    @IBOutlet weak var ManualText3: UITextField!
    @IBOutlet weak var ManualText4: UITextField!
    @IBOutlet weak var ManualText5: UITextField!
    @IBOutlet weak var ManualText6: UITextField!
    @IBOutlet weak var ManualText7: UITextField!
    @IBOutlet weak var ManualText8: UITextField!
    @IBOutlet weak var ManualText9: UITextField!
    @IBOutlet weak var ManualText10: UITextField!
    @IBOutlet weak var ManualText11: UITextField!
    @IBOutlet weak var ManualText12: UITextField!
    @IBOutlet weak var ManualText13: UITextField!
    @IBOutlet weak var ManualText14: UITextField!
    @IBOutlet weak var ManualText15: UITextField!
    @IBOutlet weak var ViewRow6: UIView!
    @IBOutlet weak var ViewRow7: UIView!
    @IBOutlet weak var ViewRow8: UIView!
    @IBOutlet weak var ViewRow9: UIView!
    @IBOutlet weak var ViewRow10: UIView!
    @IBOutlet weak var ViewRow11: UIView!
    @IBOutlet weak var ViewRow12: UIView!
    @IBOutlet weak var ViewRow13: UIView!
    @IBOutlet weak var ViewRow14: UIView!
    @IBOutlet weak var ViewRow15: UIView!
    @IBOutlet weak var JobType1button: UIButton!
    @IBOutlet weak var JobType2button: UIButton!
    @IBOutlet weak var JobType3button: UIButton!
    @IBOutlet weak var JobType4button: UIButton!
    @IBOutlet weak var JobType5button: UIButton!
    @IBOutlet weak var JobType6button: UIButton!
    @IBOutlet weak var JobType7button: UIButton!
    @IBOutlet weak var JobType8button: UIButton!
    @IBOutlet weak var JobType9button: UIButton!
    @IBOutlet weak var JobType10button: UIButton!
    @IBOutlet weak var JobType11button: UIButton!
    @IBOutlet weak var JobType12button: UIButton!
    @IBOutlet weak var JobType13button: UIButton!
    @IBOutlet weak var JobType14button: UIButton!
    @IBOutlet weak var JobType15button: UIButton!
    @IBOutlet weak var MonReg1: UITextField!
    @IBOutlet weak var MonReg2: UITextField!
    @IBOutlet weak var MonReg3: UITextField!
    @IBOutlet weak var MonReg4: UITextField!
    @IBOutlet weak var MonReg5: UITextField!
    @IBOutlet weak var MonReg6: UITextField!
    @IBOutlet weak var MonReg7: UITextField!
    @IBOutlet weak var MonReg8: UITextField!
    @IBOutlet weak var MonReg9: UITextField!
    @IBOutlet weak var MonReg10: UITextField!
    @IBOutlet weak var MonReg11: UITextField!
    @IBOutlet weak var MonReg12: UITextField!
    @IBOutlet weak var MonReg13: UITextField!
    @IBOutlet weak var MonReg14: UITextField!
    @IBOutlet weak var MonReg15: UITextField!
    @IBOutlet weak var SelectProject1: UIButton!
    @IBOutlet weak var SelectProject2: UIButton!
    @IBOutlet weak var SelectProject3: UIButton!
    @IBOutlet weak var SelectProject4: UIButton!
    @IBOutlet weak var SelectProject5: UIButton!
    @IBOutlet weak var SelectProject6: UIButton!
    @IBOutlet weak var SelectProject7: UIButton!
    @IBOutlet weak var SelectProject8: UIButton!
    @IBOutlet weak var SelectProject9: UIButton!
    @IBOutlet weak var SelectProject10: UIButton!
    @IBOutlet weak var SelectProject11: UIButton!
    @IBOutlet weak var SelectProject12: UIButton!
    @IBOutlet weak var SelectProject13: UIButton!
    @IBOutlet weak var SelectProject14: UIButton!
    @IBOutlet weak var SelectProject15: UIButton!
    @IBOutlet weak var SelectProjectLabel1: UILabel!
    @IBOutlet weak var SelectProjectLabel2: UILabel!
    @IBOutlet weak var SelectProjectLabel3: UILabel!
    @IBOutlet weak var SelectProjectLabel4: UILabel!
    @IBOutlet weak var SelectProjectLabel5: UILabel!
    @IBOutlet weak var SelectProjectLabel6: UILabel!
    @IBOutlet weak var SelectProjectLabel7: UILabel!
    @IBOutlet weak var SelectProjectLabel8: UILabel!
    @IBOutlet weak var SelectProjectLabel9: UILabel!
    @IBOutlet weak var SelectProjectLabel10: UILabel!
    @IBOutlet weak var SelectProjectLabel11: UILabel!
    @IBOutlet weak var SelectProjectLabel12: UILabel!
    @IBOutlet weak var SelectProjectLabel13: UILabel!
    @IBOutlet weak var SelectProjectLabel14: UILabel!
    @IBOutlet weak var SelectProjectLabel15: UILabel!
    @IBOutlet weak var ProjectLabelWidthConstrain1: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain2: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain3: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain4: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain5: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain6: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain7: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain8: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain9: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain10: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain11: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain12: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain13: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain14: NSLayoutConstraint!
    @IBOutlet weak var ProjectLabelWidthConstrain15: NSLayoutConstraint!
    @IBOutlet weak var MonOT1: UITextField!
    @IBOutlet weak var MonOT2: UITextField!
    @IBOutlet weak var MonOT3: UITextField!
    @IBOutlet weak var MonOT4: UITextField!
    @IBOutlet weak var MonOT5: UITextField!
    @IBOutlet weak var MonOT6: UITextField!
    @IBOutlet weak var MonOT7: UITextField!
    @IBOutlet weak var MonOT8: UITextField!
    @IBOutlet weak var MonOT9: UITextField!
    @IBOutlet weak var MonOT10: UITextField!
    @IBOutlet weak var MonOT11: UITextField!
    @IBOutlet weak var MonOT12: UITextField!
    @IBOutlet weak var MonOT13: UITextField!
    @IBOutlet weak var MonOT14: UITextField!
    @IBOutlet weak var MonOT15: UITextField!
    @IBOutlet weak var TueReg1: UITextField!
    @IBOutlet weak var TueReg2: UITextField!
    @IBOutlet weak var TueReg3: UITextField!
    @IBOutlet weak var TueReg4: UITextField!
    @IBOutlet weak var TueReg5: UITextField!
    @IBOutlet weak var TueReg6: UITextField!
    @IBOutlet weak var TueReg7: UITextField!
    @IBOutlet weak var TueReg8: UITextField!
    @IBOutlet weak var TueReg9: UITextField!
    @IBOutlet weak var TueReg10: UITextField!
    @IBOutlet weak var TueReg11: UITextField!
    @IBOutlet weak var TueReg12: UITextField!
    @IBOutlet weak var TueReg13: UITextField!
    @IBOutlet weak var TueReg14: UITextField!
    @IBOutlet weak var TueReg15: UITextField!
    @IBOutlet weak var TueOT1: UITextField!
    @IBOutlet weak var TueOT2: UITextField!
    @IBOutlet weak var TueOT3: UITextField!
    @IBOutlet weak var TueOT4: UITextField!
    @IBOutlet weak var TueOT5: UITextField!
    @IBOutlet weak var TueOT6: UITextField!
    @IBOutlet weak var TueOT7: UITextField!
    @IBOutlet weak var TueOT8: UITextField!
    @IBOutlet weak var TueOT9: UITextField!
    @IBOutlet weak var TueOT10: UITextField!
    @IBOutlet weak var TueOT11: UITextField!
    @IBOutlet weak var TueOT12: UITextField!
    @IBOutlet weak var TueOT13: UITextField!
    @IBOutlet weak var TueOT14: UITextField!
    @IBOutlet weak var TueOT15: UITextField!
    @IBOutlet weak var WedReg1: UITextField!
    @IBOutlet weak var WedReg2: UITextField!
    @IBOutlet weak var WedReg3: UITextField!
    @IBOutlet weak var WedReg4: UITextField!
    @IBOutlet weak var WedReg5: UITextField!
    @IBOutlet weak var WedReg6: UITextField!
    @IBOutlet weak var WedReg7: UITextField!
    @IBOutlet weak var WedReg8: UITextField!
    @IBOutlet weak var WedReg9: UITextField!
    @IBOutlet weak var WedReg10: UITextField!
    @IBOutlet weak var WedReg11: UITextField!
    @IBOutlet weak var WedReg12: UITextField!
    @IBOutlet weak var WedReg13: UITextField!
    @IBOutlet weak var WedReg14: UITextField!
    @IBOutlet weak var WedReg15: UITextField!
    @IBOutlet weak var WedOT1: UITextField!
    @IBOutlet weak var WedOT2: UITextField!
    @IBOutlet weak var WedOT3: UITextField!
    @IBOutlet weak var WedOT4: UITextField!
    @IBOutlet weak var WedOT5: UITextField!
    @IBOutlet weak var WedOT6: UITextField!
    @IBOutlet weak var WedOT7: UITextField!
    @IBOutlet weak var WedOT8: UITextField!
    @IBOutlet weak var WedOT9: UITextField!
    @IBOutlet weak var WedOT10: UITextField!
    @IBOutlet weak var WedOT11: UITextField!
    @IBOutlet weak var WedOT12: UITextField!
    @IBOutlet weak var WedOT13: UITextField!
    @IBOutlet weak var WedOT14: UITextField!
    @IBOutlet weak var WedOT15: UITextField!
    @IBOutlet weak var ThuReg1: UITextField!
    @IBOutlet weak var ThuReg2: UITextField!
    @IBOutlet weak var ThuReg3: UITextField!
    @IBOutlet weak var ThuReg4: UITextField!
    @IBOutlet weak var ThuReg5: UITextField!
    @IBOutlet weak var ThuReg6: UITextField!
    @IBOutlet weak var ThuReg7: UITextField!
    @IBOutlet weak var ThuReg8: UITextField!
    @IBOutlet weak var ThuReg9: UITextField!
    @IBOutlet weak var ThuReg10: UITextField!
    @IBOutlet weak var ThuReg11: UITextField!
    @IBOutlet weak var ThuReg12: UITextField!
    @IBOutlet weak var ThuReg13: UITextField!
    @IBOutlet weak var ThuReg14: UITextField!
    @IBOutlet weak var ThuReg15: UITextField!
    @IBOutlet weak var ThuOT1: UITextField!
    @IBOutlet weak var ThuOT2: UITextField!
    @IBOutlet weak var ThuOT3: UITextField!
    @IBOutlet weak var ThuOT4: UITextField!
    @IBOutlet weak var ThuOT5: UITextField!
    @IBOutlet weak var ThuOT6: UITextField!
    @IBOutlet weak var ThuOT7: UITextField!
    @IBOutlet weak var ThuOT8: UITextField!
    @IBOutlet weak var ThuOT9: UITextField!
    @IBOutlet weak var ThuOT10: UITextField!
    @IBOutlet weak var ThuOT11: UITextField!
    @IBOutlet weak var ThuOT12: UITextField!
    @IBOutlet weak var ThuOT13: UITextField!
    @IBOutlet weak var ThuOT14: UITextField!
    @IBOutlet weak var ThuOT15: UITextField!
    @IBOutlet weak var FriReg1: UITextField!
    @IBOutlet weak var FriReg2: UITextField!
    @IBOutlet weak var FriReg3: UITextField!
    @IBOutlet weak var FriReg4: UITextField!
    @IBOutlet weak var FriReg5: UITextField!
    @IBOutlet weak var FriReg6: UITextField!
    @IBOutlet weak var FriReg7: UITextField!
    @IBOutlet weak var FriReg8: UITextField!
    @IBOutlet weak var FriReg9: UITextField!
    @IBOutlet weak var FriReg10: UITextField!
    @IBOutlet weak var FriReg11: UITextField!
    @IBOutlet weak var FriReg12: UITextField!
    @IBOutlet weak var FriReg13: UITextField!
    @IBOutlet weak var FriReg14: UITextField!
    @IBOutlet weak var FriReg15: UITextField!
    @IBOutlet weak var FriOT1: UITextField!
    @IBOutlet weak var FriOT2: UITextField!
    @IBOutlet weak var FriOT3: UITextField!
    @IBOutlet weak var FriOT4: UITextField!
    @IBOutlet weak var FriOT5: UITextField!
    @IBOutlet weak var FriOT6: UITextField!
    @IBOutlet weak var FriOT7: UITextField!
    @IBOutlet weak var FriOT8: UITextField!
    @IBOutlet weak var FriOT9: UITextField!
    @IBOutlet weak var FriOT10: UITextField!
    @IBOutlet weak var FriOT11: UITextField!
    @IBOutlet weak var FriOT12: UITextField!
    @IBOutlet weak var FriOT13: UITextField!
    @IBOutlet weak var FriOT14: UITextField!
    @IBOutlet weak var FriOT15: UITextField!
    @IBOutlet weak var SatOT1: UITextField!
    @IBOutlet weak var SatOT2: UITextField!
    @IBOutlet weak var SatOT3: UITextField!
    @IBOutlet weak var SatOT4: UITextField!
    @IBOutlet weak var SatOT5: UITextField!
    @IBOutlet weak var SatOT6: UITextField!
    @IBOutlet weak var SatOT7: UITextField!
    @IBOutlet weak var SatOT8: UITextField!
    @IBOutlet weak var SatOT9: UITextField!
    @IBOutlet weak var SatOT10: UITextField!
    @IBOutlet weak var SatOT11: UITextField!
    @IBOutlet weak var SatOT12: UITextField!
    @IBOutlet weak var SatOT13: UITextField!
    @IBOutlet weak var SatOT14: UITextField!
    @IBOutlet weak var SatOT15: UITextField!
    @IBOutlet weak var SunDT1: UITextField!
    @IBOutlet weak var SunDT2: UITextField!
    @IBOutlet weak var SunDT3: UITextField!
    @IBOutlet weak var SunDT4: UITextField!
    @IBOutlet weak var SunDT5: UITextField!
    @IBOutlet weak var SunDT6: UITextField!
    @IBOutlet weak var SunDT7: UITextField!
    @IBOutlet weak var SunDT8: UITextField!
    @IBOutlet weak var SunDT9: UITextField!
    @IBOutlet weak var SunDT10: UITextField!
    @IBOutlet weak var SunDT11: UITextField!
    @IBOutlet weak var SunDT12: UITextField!
    @IBOutlet weak var SunDT13: UITextField!
    @IBOutlet weak var SunDT14: UITextField!
    @IBOutlet weak var SunDT15: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Notes Text Box Formatting
        NotesText.layer.borderWidth = 0.5; NotesText.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor; NotesText.layer.cornerRadius = 6
        NotesText.delegate = self
        NotesText.textContainer.maximumNumberOfLines = 5
        NotesText.textContainer.lineBreakMode = .byTruncatingTail
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: scrollView, action: #selector(UIView.endEditing(_:))))
        keyboardNotifications(); setUpButtonMenu(); rotateNotifications(); setupLabelTap()
        ViewRow6.isHidden = true; ViewRow7.isHidden = true; ViewRow8.isHidden = true; ViewRow9.isHidden = true
        ViewRow10.isHidden = true; ViewRow11.isHidden = true; ViewRow12.isHidden = true; ViewRow13.isHidden = true
        ViewRow14.isHidden = true; ViewRow15.isHidden = true
        NotesCalcTopConstraint.constant = 655; viewHeightConstraint.constant = 1035
        self.viewHeight = viewHeightConstraint.constant
        // Picker View setup
        pickerViewMaintenance.dataSource = self; pickerViewMaintenance.delegate = self; pickerViewMaintenance.tag = 1
        pickerViewMechanic.dataSource = self; pickerViewMechanic.delegate = self; pickerViewMechanic.tag = 2
        pickerViewConstruction.dataSource = self; pickerViewConstruction.delegate = self; pickerViewConstruction.tag = 3
        pickerViewSelectJob.dataSource = self; pickerViewSelectJob.delegate = self; pickerViewSelectJob.tag = 4
        pickerViewMaintenance.frame = CGRect(x:0,y:0,width:620,height:300)
        pickerViewConstruction.frame = CGRect(x:0,y:0,width:620,height:300)
        pickerViewSelectJob.frame = CGRect(x:0,y:0,width:620,height:300)
        pickerViewMechanic.frame = CGRect(x:0,y:0,width:500,height:200)
        // Load Data from Web
        Construction_DisplayName = Array(Construction_Dict.keys); Maintenance_DisplayName = Array(Maintenance_Dict.keys)
        Mechanic_Names.sort(); Construction_DisplayName.sort(); Maintenance_DisplayName.sort()
        if Start_Name != "" {SendUpdates()}
        else{for i in 1...15{DisplayJobType(number: i)}}
        navigationController?.delegate = self
        
        if Construction_DisplayName.count == 0 || Maintenance_DisplayName.count == 0 || Mechanic_Names.count == 0{
            let alert = UIAlertController(title: "Database Loading Error", message: "Please confirm Internet Connection. Wait 10 seconds, and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let Mechanic_Name = SelectMechaniclabel.text!
        let jobtype_array = [JobType1button.titleLabel!.text!, JobType2button.titleLabel!.text!, JobType3button.titleLabel!.text!, JobType4button.titleLabel!.text!, JobType5button.titleLabel!.text!, JobType6button.titleLabel!.text!, JobType7button.titleLabel!.text!, JobType8button.titleLabel!.text!, JobType9button.titleLabel!.text!, JobType10button.titleLabel!.text!, JobType11button.titleLabel!.text!, JobType12button.titleLabel!.text!, JobType13button.titleLabel!.text!, JobType14button.titleLabel!.text!, JobType15button.titleLabel!.text!]
        var job_changed = 0
        for Item in jobtype_array{
            if Item != "Select Job Type"{job_changed += 1}
        }
        if (Mechanic_Name != "SELECT MECHANIC" || job_changed > 0) && email_sent == 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: datePicker.date)
            let Temp_Name = "TIME SHEET - \(Mechanic_Name) - \(date_input)"
            
            let project_label_array = [SelectProjectLabel1.text!, SelectProjectLabel2.text!, SelectProjectLabel3.text!, SelectProjectLabel4.text!, SelectProjectLabel5.text!, SelectProjectLabel6.text!, SelectProjectLabel7.text!, SelectProjectLabel8.text!, SelectProjectLabel9.text!, SelectProjectLabel10.text!, SelectProjectLabel11.text!, SelectProjectLabel12.text!, SelectProjectLabel13.text!, SelectProjectLabel14.text!, SelectProjectLabel15.text!]
            let manual_array = [ManualText1.text!,ManualText2.text!,ManualText3.text!,ManualText4.text!,ManualText5.text!, ManualText6.text!,ManualText7.text!,ManualText8.text!,ManualText9.text!,ManualText10.text!, ManualText11.text!,ManualText12.text!,ManualText13.text!,ManualText14.text!,ManualText15.text!]
            let selected_row_array = ["\(selectedRow1)","\(selectedRow2)","\(selectedRow3)","\(selectedRow4)","\(selectedRow5)","\(selectedRow6)","\(selectedRow7)","\(selectedRow8)","\(selectedRow9)" ,"\(selectedRow10)","\(selectedRow11)","\(selectedRow12)","\(selectedRow13)","\(selectedRow14)","\(selectedRow15)"]
            var base_array = ["TIMESHEET",Temp_Name,Mechanic_Name,date_input,NightServicebutton.titleLabel!.text!,ProjectNumberbutton.titleLabel!.text!,NotesText.text!,"\(selectedMainMechanic)"] + selected_row_array
            base_array += jobtype_array + project_label_array + manual_array
            Reg_Hours_ = [String](); OT_Hours_ = [String](); DT_Hours_ = [String]()
            for Item in Reg_Hours {
                if Item != 0 {Reg_Hours_.append("\(Item)")
                } else {Reg_Hours_.append("")}
            }
            for Item in OT_Hours {
                if Item != 0 {OT_Hours_.append("\(Item)")
                } else {OT_Hours_.append("")}
            }
            for Item in DT_Hours {
                if Item != 0 {DT_Hours_.append("\(Item)")
                } else {DT_Hours_.append("")}
            }
            base_array += Reg_Hours_ + OT_Hours_ + DT_Hours_
            Temp_Dict = [Temp_Name: base_array]
            (viewController as? ViewController)?.Temp_Dict = Temp_Dict
            (viewController as? ViewController)?.mergeDictionarys()
            (viewController as? ViewController)?.refreshTabel()
        }
        if email_sent == 1 && Start_Name != ""{
            (viewController as? ViewController)?.deleteSavedForm(name: Start_Name)
            (viewController as? ViewController)?.refreshTabel()
        }
        (viewController as? ViewController)?.WriteSaveFormsFiles()
        (viewController as? ViewController)?.SavePostFiles()
    }
    
    func SendUpdates(){
        let jobtype_array = [JobType1button, JobType2button, JobType3button, JobType4button, JobType5button, JobType6button, JobType7button, JobType8button, JobType9button, JobType10button, JobType11button, JobType12button, JobType13button, JobType14button, JobType15button]
        let project_array = [SelectProjectLabel1, SelectProjectLabel2, SelectProjectLabel3, SelectProjectLabel4, SelectProjectLabel5, SelectProjectLabel6, SelectProjectLabel7, SelectProjectLabel8, SelectProjectLabel9, SelectProjectLabel10,SelectProjectLabel11, SelectProjectLabel12, SelectProjectLabel13, SelectProjectLabel14, SelectProjectLabel15]
        let manual_array = [ManualText1,ManualText2,ManualText3,ManualText4,ManualText5,ManualText6,ManualText7,ManualText8,ManualText9,ManualText10,ManualText11,ManualText12,ManualText13,ManualText14,ManualText15]
        // Order Matters
        RegularSet(); OvertimeSet(); DoubletimeSet()
        for i in 0...jobtype_array.count-1 {
            jobtype_array[i]?.menu?.children.forEach { action in
                    guard let action = action as? UIAction else {return}
                    if action.title == job_type_values[i] {action.state = .on}
                }
            project_array[i]?.text = project_values[i]
            manual_array[i]?.text = manual_values[i]
            DisplayJobType(number:i+1)
        }
        
        selectedRow1 = selected_row_values[0]; selectedRow2 = selected_row_values[1]; selectedRow3 = selected_row_values[2]
        selectedRow4 = selected_row_values[3]; selectedRow5 = selected_row_values[4]; selectedRow6 = selected_row_values[5]
        selectedRow7 = selected_row_values[6]; selectedRow8 = selected_row_values[7]; selectedRow9 = selected_row_values[8]
        selectedRow10 = selected_row_values[9]; selectedRow11 = selected_row_values[10]; selectedRow12 = selected_row_values[11]
        selectedRow13 = selected_row_values[12]; selectedRow14 = selected_row_values[13]; selectedRow15 = selected_row_values[14]
        ProjectNumberbutton?.menu?.children.forEach { action in
                guard let action = action as? UIAction else {return}
                if action.title == project_number_set {action.state = .on}
            }
        NightServicebutton?.menu?.children.forEach { action in
                guard let action = action as? UIAction else {return}
                if action.title == night_service_set {action.state = .on}
            }
        let formater = DateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        let date = formater.date(from: date_set) ?? Date()
        datePicker.setDate(date, animated: false)
        SelectMechaniclabel.text = mechanic_name_set
        self.ProjectQuantity(typevalue:"all")
        NotesText.text = notes_set
    }
    
    @IBAction func SelectJobNameDropDown(_ sender: UIButton) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:640,height: 300)
        let alert = UIAlertController(title: "SELECT JOB NAME", message: "", preferredStyle: .actionSheet)

        var local_selected = 0; var Label = UILabel(); var name = ""
        if sender == SelectProject1 {local_selected = self.selectedRow1; Label = SelectProjectLabel1
            name = JobType1button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject2 {local_selected = self.selectedRow2; Label = SelectProjectLabel2
            name = JobType2button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject3 {local_selected = self.selectedRow3; Label = SelectProjectLabel3
            name = JobType3button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject4 {local_selected = self.selectedRow4; Label = SelectProjectLabel4
            name = JobType4button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject5 {local_selected = self.selectedRow5; Label = SelectProjectLabel5
            name = JobType5button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject6 {local_selected = self.selectedRow6; Label = SelectProjectLabel6
            name = JobType6button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject7 {local_selected = self.selectedRow7; Label = SelectProjectLabel7
            name = JobType7button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject8 {local_selected = self.selectedRow8; Label = SelectProjectLabel8
            name = JobType8button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject9 {local_selected = self.selectedRow9; Label = SelectProjectLabel9
            name = JobType9button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject10 {local_selected = self.selectedRow10; Label = SelectProjectLabel10
            name = JobType10button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject11 {local_selected = self.selectedRow11; Label = SelectProjectLabel11
            name = JobType11button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject12 {local_selected = self.selectedRow12; Label = SelectProjectLabel12
            name = JobType12button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject13 {local_selected = self.selectedRow13; Label = SelectProjectLabel13
            name = JobType13button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject14 {local_selected = self.selectedRow14; Label = SelectProjectLabel14
            name = JobType14button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender == SelectProject15 {local_selected = self.selectedRow15; Label = SelectProjectLabel15
            name = JobType15button.menu?.selectedElements.first?.title ?? ""
        }
        var picker = UIPickerView()
        if name == "Construction"{
            picker = pickerViewConstruction; Customer_Data = Construction_DisplayName
        } else if name == "Select Job Type"{
            picker = pickerViewSelectJob; Customer_Data = ["SELECT PROJECT"]
        } else if name == "Vacation"{
            picker = pickerViewSelectJob; Customer_Data = ["VACATION DAY"]
        } else if name == "Sick"{
            picker = pickerViewSelectJob; Customer_Data = ["SICK DAY"]
        } else if name == "Holiday"{
            picker = pickerViewSelectJob; Customer_Data = ["HOLIDAY"]
        } else if name == "Stand By"{
            picker = pickerViewSelectJob; Customer_Data = ["STAND BY"]
        } else{
            picker = pickerViewMaintenance; Customer_Data = Maintenance_DisplayName
        }
        picker.selectRow(local_selected,inComponent: 0,animated: false)
        vc.view.addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = Label
        alert.popoverPresentationController?.sourceRect = Label.bounds

        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            local_selected = picker.selectedRow(inComponent: 0)
            let temp_string = self.Customer_Data[local_selected].uppercased()

            if sender == self.SelectProject1 {
                self.SelectProjectLabel1.text = temp_string
                self.selectedRow1 = local_selected}
            else if sender == self.SelectProject2 {
                self.SelectProjectLabel2.text = temp_string
                self.selectedRow2 = local_selected}
            else if sender == self.SelectProject3 {
                self.SelectProjectLabel3.text = temp_string
                self.selectedRow3 = local_selected}
            else if sender == self.SelectProject4 {
                self.SelectProjectLabel4.text = temp_string
                self.selectedRow4 = local_selected}
            else if sender == self.SelectProject5 {
                self.SelectProjectLabel5.text = temp_string
                self.selectedRow5 = local_selected}
            else if sender == self.SelectProject6 {
                self.SelectProjectLabel6.text = temp_string
                self.selectedRow6 = local_selected}
            else if sender == self.SelectProject7 {
                self.SelectProjectLabel7.text = temp_string
                self.selectedRow7 = local_selected}
            else if sender == self.SelectProject8 {
                self.SelectProjectLabel8.text = temp_string
                self.selectedRow8 = local_selected}
            else if sender == self.SelectProject9 {
                self.SelectProjectLabel9.text = temp_string
                self.selectedRow9 = local_selected}
            else if sender == self.SelectProject10 {
                self.SelectProjectLabel10.text = temp_string
                self.selectedRow10 = local_selected}
            else if sender == self.SelectProject11 {
                self.SelectProjectLabel11.text = temp_string
                self.selectedRow11 = local_selected}
            else if sender == self.SelectProject12 {
                self.SelectProjectLabel12.text = temp_string
                self.selectedRow12 = local_selected}
            else if sender == self.SelectProject13 {
                self.SelectProjectLabel13.text = temp_string
                self.selectedRow13 = local_selected}
            else if sender == self.SelectProject14 {
                self.SelectProjectLabel14.text = temp_string
                self.selectedRow14 = local_selected}
            else if sender == self.SelectProject15 {
                self.SelectProjectLabel15.text = temp_string
                self.selectedRow15 = local_selected}
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func LabelDropDown(sender: UITapGestureRecognizer) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:640,height: 300)
        let alert = UIAlertController(title: "SELECT JOB NAME", message: "", preferredStyle: .actionSheet)
    
        var local_selected = 0; var Label = UILabel(); var name = ""
        if sender.view == SelectProjectLabel1 {local_selected = self.selectedRow1; Label = SelectProjectLabel1
            name = JobType1button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel2 {local_selected = self.selectedRow2; Label = SelectProjectLabel2
            name = JobType2button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel3 {local_selected = self.selectedRow3; Label = SelectProjectLabel3
            name = JobType3button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel4 {local_selected = self.selectedRow4; Label = SelectProjectLabel4
            name = JobType4button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel5 {local_selected = self.selectedRow5; Label = SelectProjectLabel5
            name = JobType5button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel6 {local_selected = self.selectedRow6; Label = SelectProjectLabel6
            name = JobType6button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel7 {local_selected = self.selectedRow7; Label = SelectProjectLabel7
            name = JobType7button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel8 {local_selected = self.selectedRow8; Label = SelectProjectLabel8
            name = JobType8button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel9 {local_selected = self.selectedRow9; Label = SelectProjectLabel9
            name = JobType9button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel10 {local_selected = self.selectedRow10; Label = SelectProjectLabel10
            name = JobType10button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel11 {local_selected = self.selectedRow11; Label = SelectProjectLabel11
            name = JobType11button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel12 {local_selected = self.selectedRow12; Label = SelectProjectLabel12
            name = JobType12button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel13 {local_selected = self.selectedRow13; Label = SelectProjectLabel13
            name = JobType13button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel14 {local_selected = self.selectedRow14; Label = SelectProjectLabel14
            name = JobType14button.menu?.selectedElements.first?.title ?? ""
        }
        else if sender.view == SelectProjectLabel15 {local_selected = self.selectedRow15; Label = SelectProjectLabel15
            name = JobType15button.menu?.selectedElements.first?.title ?? ""
        }
        var picker = UIPickerView()
        if name == "Construction"{
            picker = pickerViewConstruction; Customer_Data = Construction_DisplayName
        } else if name == "Select Job Type"{
            picker = pickerViewSelectJob; Customer_Data = ["SELECT PROJECT"]
        } else if name == "Vacation"{
            picker = pickerViewSelectJob; Customer_Data = ["VACATION DAY"]
        } else if name == "Sick"{
            picker = pickerViewSelectJob; Customer_Data = ["SICK DAY"]
        } else if name == "Holiday"{
            picker = pickerViewSelectJob; Customer_Data = ["HOLIDAY"]
        } else if name == "Stand By"{
            picker = pickerViewSelectJob; Customer_Data = ["STAND BY"]
        } else{
            picker = pickerViewMaintenance; Customer_Data = Maintenance_DisplayName
        }
 
        picker.selectRow(local_selected,inComponent: 0,animated: false)
        vc.view.addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = Label
        alert.popoverPresentationController?.sourceRect = Label.bounds

        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            local_selected = picker.selectedRow(inComponent: 0)
            let temp_string = self.Customer_Data[local_selected].uppercased()

            if sender.view == self.SelectProjectLabel1 {
                self.SelectProjectLabel1.text = temp_string
                self.selectedRow1 = local_selected}
            else if sender.view == self.SelectProjectLabel2 {
                self.SelectProjectLabel2.text = temp_string
                self.selectedRow2 = local_selected}
            else if sender.view == self.SelectProjectLabel3 {
                self.SelectProjectLabel3.text = temp_string
                self.selectedRow3 = local_selected}
            else if sender.view == self.SelectProjectLabel4 {
                self.SelectProjectLabel4.text = temp_string
                self.selectedRow4 = local_selected}
            else if sender.view == self.SelectProjectLabel5 {
                self.SelectProjectLabel5.text = temp_string
                self.selectedRow5 = local_selected}
            else if sender.view == self.SelectProjectLabel6 {
                self.SelectProjectLabel6.text = temp_string
                self.selectedRow6 = local_selected}
            else if sender.view == self.SelectProjectLabel7 {
                self.SelectProjectLabel7.text = temp_string
                self.selectedRow7 = local_selected}
            else if sender.view == self.SelectProjectLabel8 {
                self.SelectProjectLabel8.text = temp_string
                self.selectedRow8 = local_selected}
            else if sender.view == self.SelectProjectLabel9 {
                self.SelectProjectLabel9.text = temp_string
                self.selectedRow9 = local_selected}
            else if sender.view == self.SelectProjectLabel10 {
                self.SelectProjectLabel10.text = temp_string
                self.selectedRow10 = local_selected}
            else if sender.view == self.SelectProjectLabel11 {
                self.SelectProjectLabel11.text = temp_string
                self.selectedRow11 = local_selected}
            else if sender.view == self.SelectProjectLabel12 {
                self.SelectProjectLabel12.text = temp_string
                self.selectedRow12 = local_selected}
            else if sender.view == self.SelectProjectLabel13 {
                self.SelectProjectLabel13.text = temp_string
                self.selectedRow13 = local_selected}
            else if sender.view == self.SelectProjectLabel14 {
                self.SelectProjectLabel14.text = temp_string
                self.selectedRow14 = local_selected}
            else if sender.view == self.SelectProjectLabel15 {
                self.SelectProjectLabel15.text = temp_string
                self.selectedRow15 = local_selected}
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel1.isUserInteractionEnabled = true
        SelectProjectLabel1.addGestureRecognizer(labelTap)

        let labelTap2 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel2.isUserInteractionEnabled = true
        SelectProjectLabel2.addGestureRecognizer(labelTap2)
        
        let labelTap3 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel3.isUserInteractionEnabled = true
        SelectProjectLabel3.addGestureRecognizer(labelTap3)

        let labelTap4 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel4.isUserInteractionEnabled = true
        SelectProjectLabel4.addGestureRecognizer(labelTap4)
        
        let labelTap5 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel5.isUserInteractionEnabled = true
        SelectProjectLabel5.addGestureRecognizer(labelTap5)

        let labelTap6 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel6.isUserInteractionEnabled = true
        SelectProjectLabel6.addGestureRecognizer(labelTap6)
        
        let labelTap7 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel7.isUserInteractionEnabled = true
        SelectProjectLabel7.addGestureRecognizer(labelTap7)

        let labelTap8 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel8.isUserInteractionEnabled = true
        SelectProjectLabel8.addGestureRecognizer(labelTap8)
        
        let labelTap9 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel9.isUserInteractionEnabled = true
        SelectProjectLabel9.addGestureRecognizer(labelTap9)

        let labelTap10 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel10.isUserInteractionEnabled = true
        SelectProjectLabel10.addGestureRecognizer(labelTap10)
        
        let labelTap11 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel11.isUserInteractionEnabled = true
        SelectProjectLabel11.addGestureRecognizer(labelTap11)

        let labelTap12 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel12.isUserInteractionEnabled = true
        SelectProjectLabel12.addGestureRecognizer(labelTap12)
        
        let labelTap13 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel13.isUserInteractionEnabled = true
        SelectProjectLabel13.addGestureRecognizer(labelTap13)

        let labelTap14 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel14.isUserInteractionEnabled = true
        SelectProjectLabel14.addGestureRecognizer(labelTap14)
        
        let labelTap15 = UITapGestureRecognizer(target: self, action: #selector(LabelDropDown))
        SelectProjectLabel15.isUserInteractionEnabled = true
        SelectProjectLabel15.addGestureRecognizer(labelTap15)
    
        let labelTap16 = UITapGestureRecognizer(target: self, action: #selector(MechanicLabelDropDown))
        SelectMechaniclabel.isUserInteractionEnabled = true
        SelectMechaniclabel.addGestureRecognizer(labelTap16)
        
    }
    
    func setUpButtonMenu(){
        var optionClosure = {(action:UIAction) in self.DisplayJobType(number:1)}
        JobType1button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType1button.showsMenuAsPrimaryAction = true
        JobType1button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:2)}
        JobType2button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType2button.showsMenuAsPrimaryAction = true
        JobType2button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:3)}
        JobType3button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType3button.showsMenuAsPrimaryAction = true
        JobType3button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:4)}
        JobType4button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType4button.showsMenuAsPrimaryAction = true
        JobType4button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:5)}
        JobType5button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType5button.showsMenuAsPrimaryAction = true
        JobType5button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:6)}
        JobType6button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType6button.showsMenuAsPrimaryAction = true
        JobType6button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:7)}
        JobType7button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType7button.showsMenuAsPrimaryAction = true
        JobType7button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:8)}
        JobType8button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType8button.showsMenuAsPrimaryAction = true
        JobType8button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:9)}
        JobType9button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType9button.showsMenuAsPrimaryAction = true
        JobType9button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:10)}
        JobType10button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType10button.showsMenuAsPrimaryAction = true
        JobType10button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:11)}
        JobType11button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType11button.showsMenuAsPrimaryAction = true
        JobType11button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:12)}
        JobType12button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType12button.showsMenuAsPrimaryAction = true
        JobType12button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:13)}
        JobType13button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType13button.showsMenuAsPrimaryAction = true
        JobType13button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:14)}
        JobType14button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType14button.showsMenuAsPrimaryAction = true
        JobType14button.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in self.DisplayJobType(number:15)}
        JobType15button.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Vacation",handler:optionClosure),
            UIAction(title:"Sick",handler:optionClosure),
            UIAction(title:"Holiday",handler:optionClosure),
            UIAction(title:"Stand By",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobType15button.showsMenuAsPrimaryAction = true
        JobType15button.changesSelectionAsPrimaryAction = true
        
        let optionQuantity = {(action:UIAction) in self.ProjectQuantity(typevalue:"all")}
        ProjectNumberbutton.menu = UIMenu(children: [
            UIAction(title:"5",handler:optionQuantity),
            UIAction(title:"10",handler:optionQuantity),
            UIAction(title:"15",handler:optionQuantity)])
        ProjectNumberbutton.showsMenuAsPrimaryAction = true
        ProjectNumberbutton.changesSelectionAsPrimaryAction = true
        
        optionClosure = {(action:UIAction) in print("")}
        NightServicebutton.menu = UIMenu(children: [
            UIAction(title:"Select",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        NightServicebutton.showsMenuAsPrimaryAction = true
        NightServicebutton.changesSelectionAsPrimaryAction = true
        
    }
    
    func DisplayJobType(number: Int){
        let jobtype_array = [JobType1button, JobType2button, JobType3button, JobType4button, JobType5button, JobType6button, JobType7button, JobType8button, JobType9button, JobType10button, JobType11button, JobType12button, JobType13button, JobType14button, JobType15button]
        let project_array = [SelectProjectLabel1, SelectProjectLabel2, SelectProjectLabel3, SelectProjectLabel4, SelectProjectLabel5, SelectProjectLabel6, SelectProjectLabel7, SelectProjectLabel8, SelectProjectLabel9, SelectProjectLabel10,SelectProjectLabel11, SelectProjectLabel12, SelectProjectLabel13, SelectProjectLabel14, SelectProjectLabel15]
        let project_id_array = [SelectProject1, SelectProject2, SelectProject3, SelectProject4, SelectProject5, SelectProject6, SelectProject7, SelectProject8, SelectProject9, SelectProject10,SelectProject11, SelectProject12, SelectProject13, SelectProject14, SelectProject15]
        let manual_array = [ManualText1,ManualText2,ManualText3,ManualText4,ManualText5,ManualText6,ManualText7,ManualText8,ManualText9,ManualText10,ManualText11,ManualText12,ManualText13,ManualText14,ManualText15]
        let mon_reg_array = [MonReg1,MonReg2,MonReg3,MonReg4,MonReg5,MonReg6,MonReg7,MonReg8,MonReg9,MonReg10,MonReg11,MonReg12,MonReg13,MonReg14,MonReg15]
        let tue_reg_array = [TueReg1,TueReg2,TueReg3,TueReg4,TueReg5,TueReg6,TueReg7,TueReg8,TueReg9,TueReg10,TueReg11,TueReg12,TueReg13,TueReg14,TueReg15]
        let wed_reg_array = [WedReg1,WedReg2,WedReg3,WedReg4,WedReg5,WedReg6,WedReg7,WedReg8,WedReg9,WedReg10,WedReg11,WedReg12,WedReg13,WedReg14,WedReg15]
        let thu_reg_array = [ThuReg1,ThuReg2,ThuReg3,ThuReg4,ThuReg5,ThuReg6,ThuReg7,ThuReg8,ThuReg9,ThuReg10,ThuReg11,ThuReg12,ThuReg13,ThuReg14,ThuReg15]
        let fri_reg_array = [FriReg1,FriReg2,FriReg3,FriReg4,FriReg5,FriReg6,FriReg7,FriReg8,FriReg9,FriReg10,FriReg11,FriReg12,FriReg13,FriReg14,FriReg15]
        let mon_ot_array = [MonOT1,MonOT2,MonOT3,MonOT4,MonOT5,MonOT6,MonOT7,MonOT8,MonOT9,MonOT10,MonOT11,MonOT12,MonOT13,MonOT14,MonOT15]
        let tue_ot_array = [TueOT1,TueOT2,TueOT3,TueOT4,TueOT5,TueOT6,TueOT7,TueOT8,TueOT9,TueOT10,TueOT11,TueOT12,TueOT13,TueOT14,TueOT15]
        let wed_ot_array = [WedOT1,WedOT2,WedOT3,WedOT4,WedOT5,WedOT6,WedOT7,WedOT8,WedOT9,WedOT10,WedOT11,WedOT12,WedOT13,WedOT14,WedOT15]
        let thu_ot_array = [ThuOT1,ThuOT2,ThuOT3,ThuOT4,ThuOT5,ThuOT6,ThuOT7,ThuOT8,ThuOT9,ThuOT10,ThuOT11,ThuOT12,ThuOT13,ThuOT14,ThuOT15]
        let fri_ot_array = [FriOT1,FriOT2,FriOT3,FriOT4,FriOT5,FriOT6,FriOT7,FriOT8,FriOT9,FriOT10,FriOT11,FriOT12,FriOT13,FriOT14,FriOT15]
        let sat_ot_array = [SatOT1,SatOT2,SatOT3,SatOT4,SatOT5,SatOT6,SatOT7,SatOT8,SatOT9,SatOT10,SatOT11,SatOT12,SatOT13,SatOT14,SatOT15]
        let sun_dt_array = [SunDT1,SunDT2,SunDT3,SunDT4,SunDT5,SunDT6,SunDT7,SunDT8,SunDT9,SunDT10,SunDT11,SunDT12,SunDT13,SunDT14,SunDT15]
        
        let name = jobtype_array[number-1]?.menu?.selectedElements.first?.title
        let project_label = project_array[number-1]
        if name == "Manual Entry"{
            project_id_array[number-1]?.isHidden = true; project_label?.isHidden = true; manual_array[number-1]?.isHidden = false
        } else {
            project_id_array[number-1]?.isHidden = false; project_label?.isHidden = false; manual_array[number-1]?.isHidden = true
        }
        let Mon = mon_reg_array[number-1]; let Tue = tue_reg_array[number-1]; let Wed = wed_reg_array[number-1]
        let Thu = thu_reg_array[number-1]; let Fri = fri_reg_array[number-1]; let Sat = sat_ot_array[number-1]; let Sun = sun_dt_array[number-1]
        let Mon_OT = mon_ot_array[number-1]; let Tue_OT = tue_ot_array[number-1]; let Wed_OT = wed_ot_array[number-1]
        let Thu_OT = thu_ot_array[number-1]; let Fri_OT = fri_ot_array[number-1];
        
        if name == "Select Job Type"{
            project_label?.text = "SELECT PROJECT"
            Mon?.text = ""; Tue?.text = ""; Wed?.text = ""; Thu?.text = ""; Fri?.text = ""; Sun?.text = ""
            Mon_OT?.text = ""; Tue_OT?.text = ""; Wed_OT?.text = ""; Thu_OT?.text = ""; Fri_OT?.text = ""; Sat?.text = ""
            Mon?.isEnabled = false; Tue?.isEnabled = false; Wed?.isEnabled = false; Thu?.isEnabled = false; Fri?.isEnabled = false; Sun?.isEnabled = false
            Mon_OT?.isEnabled = false; Tue_OT?.isEnabled = false; Wed_OT?.isEnabled = false; Thu_OT?.isEnabled = false; Fri_OT?.isEnabled = false; Sat?.isEnabled = false
        } else {
            Mon?.isEnabled = true; Tue?.isEnabled = true; Wed?.isEnabled = true; Thu?.isEnabled = true; Fri?.isEnabled = true; Sun?.isEnabled = true
            Mon_OT?.isEnabled = true; Tue_OT?.isEnabled = true; Wed_OT?.isEnabled = true; Thu_OT?.isEnabled = true; Fri_OT?.isEnabled = true; Sat?.isEnabled = true
        }
        if name == "Vacation" || name == "Sick" || name == "Holiday" || name == "Stand By"{
            if name == "Vacation"{project_label?.text = "VACATION DAY"}
            else if name == "Sick" {project_label?.text = "SICK DAY"}
            else if name == "Stand By" {project_label?.text = "STAND BY"}
            else if name == "Holiday" {project_label?.text = "HOLIDAY"}
            
            Mon_OT?.isEnabled = false; Tue_OT?.isEnabled = false; Wed_OT?.isEnabled = false; Thu_OT?.isEnabled = false; Fri_OT?.isEnabled = false; Sat?.isEnabled = false; Sun?.isEnabled = false
            Mon_OT?.text = ""; Tue_OT?.text = ""; Wed_OT?.text = ""; Thu_OT?.text = ""; Fri_OT?.text = ""; Sat?.text = ""; Sun?.text = ""
        } else {
            if project_label?.text == "VACATION DAY" || project_label?.text == "SICK DAY" || project_label?.text == "HOLIDAY" || project_label?.text == "STAND BY"{
                project_label?.text = "SELECT PROJECT"
            }
        }
        // Update Calculation
        RegularAddition(ViewRow6); OvertimeAddition(ViewRow6); DoubletimeAddition(ViewRow6)
    }
    
    func ProjectQuantity(typevalue: String){
        let name = ProjectNumberbutton.menu?.selectedElements.first?.title

        if name == "5" && typevalue == "all"{
            ViewRow6.isHidden = true; ViewRow7.isHidden = true
            ViewRow8.isHidden = true; ViewRow9.isHidden = true; ViewRow10.isHidden = true
            ViewRow11.isHidden = true; ViewRow12.isHidden = true; ViewRow13.isHidden = true
            ViewRow14.isHidden = true; ViewRow15.isHidden = true
            NotesCalcTopConstraint.constant = 655
            viewHeightConstraint.constant = 1035
            self.viewHeight = viewHeightConstraint.constant
        }
        else if name == "10" && typevalue == "all"{
            ViewRow6.isHidden = false; ViewRow7.isHidden = false
            ViewRow8.isHidden = false; ViewRow9.isHidden = false; ViewRow10.isHidden = false
            ViewRow11.isHidden = true; ViewRow12.isHidden = true; ViewRow13.isHidden = true
            ViewRow14.isHidden = true; ViewRow15.isHidden = true
            NotesCalcTopConstraint.constant = 1045
            viewHeightConstraint.constant = 1428
            self.viewHeight = viewHeightConstraint.constant
        }
        else if name == "15" && typevalue == "all"{
            ViewRow6.isHidden = false; ViewRow7.isHidden = false
            ViewRow8.isHidden = false; ViewRow9.isHidden = false; ViewRow10.isHidden = false
            ViewRow11.isHidden = false; ViewRow12.isHidden = false; ViewRow13.isHidden = false
            ViewRow14.isHidden = false; ViewRow15.isHidden = false
            NotesCalcTopConstraint.constant = 1435
            viewHeightConstraint.constant = 1815
            self.viewHeight = viewHeightConstraint.constant
        }
        
        let name_number = Int(truncating: NumberFormatter().number(from: name ?? "0") ?? 0)
        if (typevalue == "Reg" || typevalue == "all") && Reg_Hours.count != 0{
            let Reg_Hours_split = Reg_Hours[0 ..< name_number*5]
            let sum = round(Reg_Hours_split.reduce(0, +)*2)/2
            RegHoursTotal.text = "\(sum)"
        }
        if (typevalue == "OT" || typevalue == "all") && OT_Hours.count != 0{
            let OT_Hours_split = OT_Hours[0 ..< name_number*6]
            let sum = round(OT_Hours_split.reduce(0, +)*2)/2
            OTHoursTotal.text = "\(sum)"
        }
        if (typevalue == "DT" || typevalue == "all") && DT_Hours.count != 0{
            let DT_Hours_split = DT_Hours[0 ..< name_number]
            let sum = round(DT_Hours_split.reduce(0, +)*2)/2
            DTHoursTotal.text = "\(sum)"
        }
    }
    
    @objc func MechanicLabelDropDown(sender: UITapGestureRecognizer) {ActualMechanicDropDown()}
    
    @IBAction func MechanicDropDown(_ sender: Any) {ActualMechanicDropDown()}
    
    func ActualMechanicDropDown() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:510,height: 200)
        let alert = UIAlertController(title: "Select Mechanic", message: "", preferredStyle: .actionSheet)
        pickerViewMechanic.selectRow(selectedMainMechanic,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewMechanic)
        pickerViewMechanic.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewMechanic.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = SelectMechaniclabel
        alert.popoverPresentationController?.sourceRect = SelectMechaniclabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            self.selectedMainMechanic = self.pickerViewMechanic.selectedRow(inComponent: 0)
            self.SelectMechaniclabel.text = self.Mechanic_Names[self.selectedMainMechanic].uppercased()
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            viewHeightConstraint.constant = self.viewHeight + keyboardHeight
            view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        viewHeightConstraint.constant = self.viewHeight
        view.layoutIfNeeded()
    }
    
    func keyboardNotifications() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func orientationChanged(_ notification: NSNotification) {
        let current_width = UIScreen.main.bounds.size.width
        let current_height = UIScreen.main.bounds.size.height
        let isFlat = UIDevice.current.orientation.isFlat
        let isPortrait = UIDevice.current.orientation.isPortrait
        if isFlat{self.current_orientation = "Flat"}
        else if isPortrait{self.current_orientation = "Portrait"}
        else {self.current_orientation = "Landscape"}
        if (previous_orientation == "Landscape" && (current_orientation == "Landscape" || current_orientation == "Flat")) || (previous_orientation == "Portrait" && (current_orientation == "Portrait" || current_orientation == "Flat")) {
            let use_width = current_width - 670
            ProjectLabelWidthConstrain1.constant = use_width
            ProjectLabelWidthConstrain2.constant = use_width
            ProjectLabelWidthConstrain3.constant = use_width
            ProjectLabelWidthConstrain4.constant = use_width
            ProjectLabelWidthConstrain5.constant = use_width
            ProjectLabelWidthConstrain6.constant = use_width
            ProjectLabelWidthConstrain7.constant = use_width
            ProjectLabelWidthConstrain8.constant = use_width
            ProjectLabelWidthConstrain9.constant = use_width
            ProjectLabelWidthConstrain10.constant = use_width
            ProjectLabelWidthConstrain11.constant = use_width
            ProjectLabelWidthConstrain12.constant = use_width
            ProjectLabelWidthConstrain13.constant = use_width
            ProjectLabelWidthConstrain14.constant = use_width
            ProjectLabelWidthConstrain15.constant = use_width
        }
        else {
            previous_orientation = current_orientation
            let use_width = current_height - 670
            ProjectLabelWidthConstrain1.constant = use_width
            ProjectLabelWidthConstrain2.constant = use_width
            ProjectLabelWidthConstrain3.constant = use_width
            ProjectLabelWidthConstrain4.constant = use_width
            ProjectLabelWidthConstrain5.constant = use_width
            ProjectLabelWidthConstrain6.constant = use_width
            ProjectLabelWidthConstrain7.constant = use_width
            ProjectLabelWidthConstrain8.constant = use_width
            ProjectLabelWidthConstrain9.constant = use_width
            ProjectLabelWidthConstrain10.constant = use_width
            ProjectLabelWidthConstrain11.constant = use_width
            ProjectLabelWidthConstrain12.constant = use_width
            ProjectLabelWidthConstrain13.constant = use_width
            ProjectLabelWidthConstrain14.constant = use_width
            ProjectLabelWidthConstrain15.constant = use_width
        }
    }
    
    func rotateNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        let current_width = UIScreen.main.bounds.size.width
        let current_height = UIScreen.main.bounds.size.height
        if current_width > current_height {self.previous_orientation = "Landscape"}
        else if current_width < current_height {self.previous_orientation = "Portrait"}
        let use_width = current_width - 670
        ProjectLabelWidthConstrain1.constant = use_width
        ProjectLabelWidthConstrain2.constant = use_width
        ProjectLabelWidthConstrain3.constant = use_width
        ProjectLabelWidthConstrain4.constant = use_width
        ProjectLabelWidthConstrain5.constant = use_width
        ProjectLabelWidthConstrain6.constant = use_width
        ProjectLabelWidthConstrain7.constant = use_width
        ProjectLabelWidthConstrain8.constant = use_width
        ProjectLabelWidthConstrain9.constant = use_width
        ProjectLabelWidthConstrain10.constant = use_width
        ProjectLabelWidthConstrain11.constant = use_width
        ProjectLabelWidthConstrain12.constant = use_width
        ProjectLabelWidthConstrain13.constant = use_width
        ProjectLabelWidthConstrain14.constant = use_width
        ProjectLabelWidthConstrain15.constant = use_width
    }
    
    @IBAction func RegularAddition(_ sender: Any) {
        Reg_Hours = [Float]()
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg1.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg1.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg1.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg1.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg1.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg2.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg2.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg2.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg2.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg2.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg3.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg3.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg3.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg3.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg3.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg4.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg4.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg4.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg4.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg4.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg5.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg5.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg5.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg5.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg5.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg6.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg6.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg6.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg6.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg6.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg7.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg7.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg7.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg7.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg7.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg8.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg8.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg8.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg8.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg8.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg9.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg9.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg9.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg9.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg9.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg10.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg10.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg10.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg10.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg10.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg11.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg11.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg11.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg11.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg11.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg12.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg12.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg12.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg12.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg12.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg13.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg13.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg13.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg13.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg13.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg14.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg14.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg14.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg14.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg14.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: MonReg15.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: TueReg15.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: WedReg15.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: ThuReg15.text!) ?? 0))
        Reg_Hours.append(Float(truncating: NumberFormatter().number(from: FriReg15.text!) ?? 0))

        self.ProjectQuantity(typevalue: "Reg")
    }
    
    @IBAction func OvertimeAddition(_ sender: Any) {
        OT_Hours = [Float]()
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT1.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT2.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT3.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT4.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT5.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT6.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT7.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT8.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT9.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT10.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT11.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT12.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT13.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT14.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: MonOT15.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: TueOT15.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: WedOT15.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: ThuOT15.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: FriOT15.text!) ?? 0))
        OT_Hours.append(Float(truncating: NumberFormatter().number(from: SatOT15.text!) ?? 0))
        
        self.ProjectQuantity(typevalue: "OT")
    }
    
    @IBAction func DoubletimeAddition(_ sender: Any) {
        DT_Hours = [Float]()
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT1.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT2.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT3.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT4.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT5.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT6.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT7.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT8.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT9.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT10.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT11.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT12.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT13.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT14.text!) ?? 0))
        DT_Hours.append(Float(truncating: NumberFormatter().number(from: SunDT15.text!) ?? 0))
        
        self.ProjectQuantity(typevalue: "DT")
    }
    
    func createFlyer() -> Data {
        // 1
        let author = SelectMechaniclabel.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date_input = dateFormatter.string(from: datePicker.date)
        let title = "\(author ?? "Pierpont Mechanical")_" + self.title_page + "_\(date_input)"
        let pdfMetaData = [
            kCGPDFContextCreator: "Pierpont Mechanical",
            kCGPDFContextAuthor: author,
            kCGPDFContextTitle: title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        // Page Setup
        let pageWidth = 11 * 72.0; let pageHeight = 8.5 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            // 5
            context.beginPage()
            // Create Filled Color Rects
            if let graphic_context = UIGraphicsGetCurrentContext(){
                var rect = CGRect(x: 0, y: 0, width: 792, height: 612)
                graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                graphic_context.fill(rect)
                graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                rect = CGRect(x: 20, y: 115, width: 750, height: 13)
                graphic_context.fill(rect)
            }
            
            let maxHeight = pageRect.height * 0.17
            let maxWidth = pageRect.width * 0.17
            // 2
            let aspectWidth = maxWidth / (self.logo_image?.size.width ?? 0)
            let aspectHeight = maxHeight / (self.logo_image?.size.height ?? 0)
            let aspectRatio = min(aspectWidth, aspectHeight)
            // 3
            let scaledWidth = (self.logo_image?.size.width ?? 0) * aspectRatio
            let scaledHeight = (self.logo_image?.size.height ?? 0) * aspectRatio
            // 4
            //let imageX = (pageRect.width - scaledWidth) / 2.0
            let imageRect = CGRect(x: 18, y: 18, width: scaledWidth, height: scaledHeight)
            // 5
            self.logo_image?.draw(in: imageRect)
          
            let address1 = "250 Fulton Avenue"
            let address2 = "Garden City Park, NY 11040"
            let address3 = "Phone (516)746-7300"
            let address4 = "Fax (516)746-7302"
          
            var attributes = [NSAttributedString.Key.font: UIFont(name:"SerifGothicRegular",size: 8)]
            address1.draw(at: CGPoint(x: 660, y: 23), withAttributes: attributes as [NSAttributedString.Key : Any])
            address2.draw(at: CGPoint(x: 660, y: 33), withAttributes: attributes as [NSAttributedString.Key : Any])
            address3.draw(at: CGPoint(x: 660, y: 43), withAttributes: attributes as [NSAttributedString.Key : Any])
            address4.draw(at: CGPoint(x: 660, y: 53), withAttributes: attributes as [NSAttributedString.Key : Any])
          
            // 1
            let titleFont = UIFont(name: "AlegreyaSansSC-Black", size: 28.0)
            let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont]
            let attributedTitle = NSAttributedString(string: self.title_page, attributes: titleAttributes)
            let titleStringSize = attributedTitle.size()
            let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,y: 25, width: titleStringSize.width,height: titleStringSize.height)
            attributedTitle.draw(in: titleStringRect)
            
            attributes = [NSAttributedString.Key.font: UIFont(name:"AlegreyaSansSC-Bold",size: 11)]
            let attributes_small = [NSAttributedString.Key.font: UIFont(name:"Roboto-Bold",size: 10)]
            let attributes_white = [NSAttributedString.Key.font: UIFont(name:"AlegreyaSansSC-Bold",size: 11), NSAttributedString.Key.foregroundColor : UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1)]
            var textFont = [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)]
            let bold_text = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 10.0)]
            
            let label5 = "WEEK ENDING:"
            let label6 = "PROJECT"
            let label7 = "MON"
            let label8 = "TUE"
            let label9 = "WED"
            let label10 = "THU"
            let label11 = "FRI"
            let label18 = "SAT"
            let label19 = "SUN"
            let label12 = "MECHANIC NAME:"
            let label14 = "NOTES:"
            let label15 = "REG."
            let label16 = "O.T."
            let label17 = "D.T."
            let label20 = "REGULAR TOTAL"
            let label21 = "OVERTIME TOTAL"
            let label22 = "DOUBLETIME TOTAL"
            let label23 = "NIGHT SERVICE:"
            let label24 = "VACATION TOTAL"
            let label25 = "SICK TOTAL"

            // Mechanic Info
            label12.draw(at: CGPoint(x: 25, y: 80), withAttributes: attributes_small as [NSAttributedString.Key : Any])
            label5.draw(at: CGPoint(x: 25, y: 95), withAttributes: attributes_small as [NSAttributedString.Key : Any])
            author?.draw(at: CGPoint(x: 115, y: 80), withAttributes: textFont as [NSAttributedString.Key : Any])
            date_input.draw(at: CGPoint(x: 98, y: 95), withAttributes: textFont as [NSAttributedString.Key : Any])
            label23.draw(at: CGPoint(x: 210, y: 95), withAttributes: attributes_small as [NSAttributedString.Key : Any])
            NightServicebutton.titleLabel?.text?.uppercased().draw(at: CGPoint(x: 290, y: 95), withAttributes: textFont as [NSAttributedString.Key : Any])
            
            // Project Lables
            var base = 340
            var width = 65
            label6.draw(at: CGPoint(x: 25, y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label7.draw(at: CGPoint(x: base, y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label8.draw(at: CGPoint(x: base+width, y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label9.draw(at: CGPoint(x: base+(width*2), y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label10.draw(at: CGPoint(x: base+(width*3), y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label11.draw(at: CGPoint(x: base+(width*4), y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label18.draw(at: CGPoint(x: base+(width*5), y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label19.draw(at: CGPoint(x: base+(width*6), y: 115), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            
            var max_array = 4
            var vacation_total = 0.0; var sick_total = 0.0
            let row_count = ProjectNumberbutton.titleLabel?.text
            var array_1 = [SelectProjectLabel1, SelectProjectLabel2, SelectProjectLabel3, SelectProjectLabel4, SelectProjectLabel5]
            let array_2 = [SelectProjectLabel6, SelectProjectLabel7, SelectProjectLabel8, SelectProjectLabel9, SelectProjectLabel10]
            let array_3 = [SelectProjectLabel11, SelectProjectLabel12, SelectProjectLabel13, SelectProjectLabel14, SelectProjectLabel15]
            var jobtype_array1 = [JobType1button, JobType2button, JobType3button, JobType4button, JobType5button]
            let jobtype_array2 = [JobType6button, JobType7button, JobType8button, JobType9button, JobType10button]
            let jobtype_array3 = [JobType11button, JobType12button, JobType13button, JobType14button, JobType15button]
            var manual_array1 = [ManualText1,ManualText2,ManualText3,ManualText4,ManualText5]
            let manual_array2 = [ManualText6,ManualText7,ManualText8,ManualText9,ManualText10]
            let manual_array3 = [ManualText11,ManualText12,ManualText13,ManualText14,ManualText15]
            if row_count == "10"{
                array_1 += array_2; max_array = 9; jobtype_array1 += jobtype_array2; manual_array1 += manual_array2
            } else if row_count == "15"{
                array_1 += array_2 + array_3; max_array = 14; jobtype_array1 += jobtype_array2 + jobtype_array3; manual_array1 += manual_array2 + manual_array3
            }
            base = 130; let height = 10
            for i in 0...max_array {
                var cancel_ = 0
                let item_text = array_1[i]?.text
                let job_type = jobtype_array1[i]?.titleLabel?.text
                let manual_text = manual_array1[i]?.text
                if job_type == "Manual Entry" && manual_text == "" {cancel_ = 1}
                if (item_text != "SELECT PROJECT" || job_type != "Select Job Type") && cancel_ == 0{
                    job_type?.draw(at: CGPoint(x: 25, y: base), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    if job_type != "Manual Entry"{
                        item_text?.draw(at: CGPoint(x: 25, y: base+height), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    } else {
                        manual_text?.uppercased().draw(at: CGPoint(x: 25, y: base+height), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    }
                    // Reg Hours
                    label15.draw(at: CGPoint(x: 290, y: base), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    var width = 340
                    for j in 0...4 {
                        let start = i*5
                        "\(Reg_Hours[start+j])".draw(at: CGPoint(x: width, y: base), withAttributes: textFont as [NSAttributedString.Key : Any])
                        width += 65
                    }
                    if job_type == "Vacation"{
                        for j in 0...4 {
                            let start = i*5
                            vacation_total += Double(Reg_Hours[start+j])}
                    }
                    if job_type == "Sick"{
                        for j in 0...4 {
                            let start = i*5
                            sick_total += Double(Reg_Hours[start+j])}
                    }
                    // OT Hours
                    label16.draw(at: CGPoint(x: 290, y: base+height), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    width = 340
                    for j in 0...5 {
                        let start = i*6
                        "\(OT_Hours[start+j])".draw(at: CGPoint(x: width, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                        width += 65
                    }
                    // DT Hours
                    label17.draw(at: CGPoint(x: 703, y: base+height), withAttributes: bold_text as [NSAttributedString.Key : Any])
                    "\(DT_Hours[i])".draw(at: CGPoint(x: 730, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                    base += 25
                }
            }
           
            base += 5; let offset = 20
            
            if let graphic_context = UIGraphicsGetCurrentContext(){
                graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                var rect = CGRect(x: 20, y: base, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: base+40, width: 200, height: 13)
                graphic_context.fill(rect)
            }
            // Labor Hours
            label20.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label21.draw(at: CGPoint(x: 130, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label22.draw(at: CGPoint(x: 235, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            RegHoursTotal.text?.draw(at: CGPoint(x: 50, y: base+offset), withAttributes: bold_text as [NSAttributedString.Key : Any])
            OTHoursTotal.text?.draw(at: CGPoint(x: 159, y: base+offset), withAttributes: bold_text as [NSAttributedString.Key : Any])
            DTHoursTotal.text?.draw(at: CGPoint(x: 269, y: base+offset), withAttributes: bold_text as [NSAttributedString.Key : Any])
            
            // Notes
            label14.draw(at: CGPoint(x: 380, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            // Text
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural; paragraphStyle.lineBreakMode = .byWordWrapping
            // 3
            let textAttributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                  NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)]
            let attributedText = NSAttributedString(string:self.NotesText.text, attributes: textAttributes)
            attributedText.draw(in: CGRect(x: 380, y: base+15, width: 380, height: 75))
            
            base += 40
            label25.draw(at: CGPoint(x: 33, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label24.draw(at: CGPoint(x: 130, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            "\(sick_total)".draw(at: CGPoint(x: 50, y: base+offset), withAttributes: bold_text as [NSAttributedString.Key : Any])
            "\(vacation_total)".draw(at: CGPoint(x: 159, y: base+offset), withAttributes: bold_text as [NSAttributedString.Key : Any])
        }
        return data
    }
    
    @IBAction func SendEmailClick(_ sender: Any) {
        if confirmInformationSubmitted(){
            self.data = self.createFlyer()
            //performSegue(withIdentifier: "PDFshow", sender: self)
            let mechanic = SelectMechaniclabel.text!
            let dateFormatter = DateFormatter(); dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_sheet = dateFormatter.string(from: datePicker.date)
            
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["dispatch@pierpontmech.com"])
                mail.setSubject("\(mechanic)_Time Sheet_\(date_sheet)")
                mail.setMessageBody("Dear PIERPONT MECH DISPATCH,<br><br>\(mechanic) completed a time sheet for the week ending in \(date_sheet). This is an automated receipt for time sheet submission.<br><br>Thanks,", isHTML: true)
                mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "\(mechanic)_Time Sheet_\(date_sheet).pdf")
                present(mail, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Device Mail Application Error", message: "Please Sign in to Company Email Account.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func confirmInformationSubmitted() -> Bool {
        var error_string = ""
        var error_count = 0
        
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: datePicker.date)
        let weekDay = myComponents.weekday
                
        if SelectMechaniclabel.text == "SELECT MECHANIC" {
            error_count += 1
            error_string += "\n\(error_count). MECHANIC NAME"
        }
        if NightServicebutton.titleLabel?.text == "Select" {
            error_count += 1
            error_string += "\n\(error_count). NIGHT SERVICE"
        }
        if weekDay != 1 {
            error_count += 1
            error_string += "\n\(error_count). SUNDAY WEEK ENDING"
        }
        
        if error_string == "" {

            var max_array = 4
            let row_count = ProjectNumberbutton.titleLabel?.text
            var array_1 = [SelectProjectLabel1, SelectProjectLabel2, SelectProjectLabel3, SelectProjectLabel4, SelectProjectLabel5]
            let array_2 = [SelectProjectLabel6, SelectProjectLabel7, SelectProjectLabel8, SelectProjectLabel9, SelectProjectLabel10]
            let array_3 = [SelectProjectLabel11, SelectProjectLabel12, SelectProjectLabel13, SelectProjectLabel14, SelectProjectLabel15]
            var jobtype_array1 = [JobType1button, JobType2button, JobType3button, JobType4button, JobType5button]
            let jobtype_array2 = [JobType6button, JobType7button, JobType8button, JobType9button, JobType10button]
            let jobtype_array3 = [JobType11button, JobType12button, JobType13button, JobType14button, JobType15button]
            var manual_array1 = [ManualText1,ManualText2,ManualText3,ManualText4,ManualText5]
            let manual_array2 = [ManualText6,ManualText7,ManualText8,ManualText9,ManualText10]
            let manual_array3 = [ManualText11,ManualText12,ManualText13,ManualText14,ManualText15]
            if row_count == "10"{
                array_1 += array_2; max_array = 9; jobtype_array1 += jobtype_array2; manual_array1 += manual_array2
            } else if row_count == "15"{
                array_1 += array_2 + array_3; max_array = 14; jobtype_array1 += jobtype_array2 + jobtype_array3; manual_array1 += manual_array2 + manual_array3
            }
            for i in 0...max_array {
                let item_text = array_1[i]?.text
                let job_type = jobtype_array1[i]?.titleLabel?.text
                let manual_text = manual_array1[i]?.text
                if job_type == "Manual Entry" && manual_text == "" {
                    error_string += "\nRow #\(i+1)"
                }
                if (item_text == "SELECT PROJECT" && job_type != "Select Job Type") && job_type != "Manual Entry"{
                    error_string += "\nRow #\(i+1)"
                }
                if (item_text == "VACATION DAY" && job_type != "Vacation") && job_type != "Manual Entry"{
                    error_string += "\nRow #\(i+1) Job Type -> Vacation"
                }
                if (item_text == "SICK DAY" && job_type != "Sick") && job_type != "Manual Entry"{
                    error_string += "\nRow #\(i+1) Job Type -> Sick"
                }
            }
            if error_string == "" {return true}
            else {
                let alert = UIAlertController(title: "Row Completion Error",
                    message: "Select Project or Deactivate:\(error_string)\n\n Note -> 'Select Job Type' Deactivates Row", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Please Provide the Following:",
                message: "\(error_string)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "PDFshow" {
        guard let vc = segue.destination as? ViewControllerTemp else { return }
          vc.documentData = self.data
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result == MFMailComposeResult.sent {
            self.email_sent = 1; _ = navigationController?.popViewController(animated: true)
        }
        controller.dismiss(animated: true, completion: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {return Maintenance_DisplayName.count}
        else if pickerView.tag == 2 {return Mechanic_Names.count}
        else if pickerView.tag == 3 {return Construction_DisplayName.count}
        else {return 1}
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x:0,y:0,width: 760, height: 35))
        if pickerView.tag == 1 {label.text = Maintenance_DisplayName[row].uppercased()}
        else if pickerView.tag == 2 {label.text = Mechanic_Names[row].uppercased()}
        else if pickerView.tag == 3 {label.text = Construction_DisplayName[row].uppercased()}
        else {label.text = Customer_Data[0]}
        label.font = UIFont(name:"Roboto-Bold",size: 18)
        label.sizeToFit()
        return label
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
        let newLines = text.components(separatedBy: CharacterSet.newlines)
        let linesAfterChange = existingLines.count + newLines.count - 1

        return linesAfterChange <= textView.textContainer.maximumNumberOfLines
    }
    
    func RegularSet() {
        MonReg1.text = Reg_Hours_[0]
        TueReg1.text = Reg_Hours_[1]
        WedReg1.text = Reg_Hours_[2]
        ThuReg1.text = Reg_Hours_[3]
        FriReg1.text = Reg_Hours_[4]
        MonReg2.text = Reg_Hours_[5]
        TueReg2.text = Reg_Hours_[6]
        WedReg2.text = Reg_Hours_[7]
        ThuReg2.text = Reg_Hours_[8]
        FriReg2.text = Reg_Hours_[9]
        MonReg3.text = Reg_Hours_[10]
        TueReg3.text = Reg_Hours_[11]
        WedReg3.text = Reg_Hours_[12]
        ThuReg3.text = Reg_Hours_[13]
        FriReg3.text = Reg_Hours_[14]
        MonReg4.text = Reg_Hours_[15]
        TueReg4.text = Reg_Hours_[16]
        WedReg4.text = Reg_Hours_[17]
        ThuReg4.text = Reg_Hours_[18]
        FriReg4.text = Reg_Hours_[19]
        MonReg5.text = Reg_Hours_[20]
        TueReg5.text = Reg_Hours_[21]
        WedReg5.text = Reg_Hours_[22]
        ThuReg5.text = Reg_Hours_[23]
        FriReg5.text = Reg_Hours_[24]
        MonReg6.text = Reg_Hours_[25]
        TueReg6.text = Reg_Hours_[26]
        WedReg6.text = Reg_Hours_[27]
        ThuReg6.text = Reg_Hours_[28]
        FriReg6.text = Reg_Hours_[29]
        MonReg7.text = Reg_Hours_[30]
        TueReg7.text = Reg_Hours_[31]
        WedReg7.text = Reg_Hours_[32]
        ThuReg7.text = Reg_Hours_[33]
        FriReg7.text = Reg_Hours_[34]
        MonReg8.text = Reg_Hours_[35]
        TueReg8.text = Reg_Hours_[36]
        WedReg8.text = Reg_Hours_[37]
        ThuReg8.text = Reg_Hours_[38]
        FriReg8.text = Reg_Hours_[39]
        MonReg9.text = Reg_Hours_[40]
        TueReg9.text = Reg_Hours_[41]
        WedReg9.text = Reg_Hours_[42]
        ThuReg9.text = Reg_Hours_[43]
        FriReg9.text = Reg_Hours_[44]
        MonReg10.text = Reg_Hours_[45]
        TueReg10.text = Reg_Hours_[46]
        WedReg10.text = Reg_Hours_[47]
        ThuReg10.text = Reg_Hours_[48]
        FriReg10.text = Reg_Hours_[49]
        MonReg11.text = Reg_Hours_[50]
        TueReg11.text = Reg_Hours_[51]
        WedReg11.text = Reg_Hours_[52]
        ThuReg11.text = Reg_Hours_[53]
        FriReg11.text = Reg_Hours_[54]
        MonReg12.text = Reg_Hours_[55]
        TueReg12.text = Reg_Hours_[56]
        WedReg12.text = Reg_Hours_[57]
        ThuReg12.text = Reg_Hours_[58]
        FriReg12.text = Reg_Hours_[59]
        MonReg13.text = Reg_Hours_[60]
        TueReg13.text = Reg_Hours_[61]
        WedReg13.text = Reg_Hours_[62]
        ThuReg13.text = Reg_Hours_[63]
        FriReg13.text = Reg_Hours_[64]
        MonReg14.text = Reg_Hours_[65]
        TueReg14.text = Reg_Hours_[66]
        WedReg14.text = Reg_Hours_[67]
        ThuReg14.text = Reg_Hours_[68]
        FriReg14.text = Reg_Hours_[69]
        MonReg15.text = Reg_Hours_[70]
        TueReg15.text = Reg_Hours_[71]
        WedReg15.text = Reg_Hours_[72]
        ThuReg15.text = Reg_Hours_[73]
        FriReg15.text = Reg_Hours_[74]

    }
    
    func OvertimeSet() {
        MonOT1.text = OT_Hours_[0]
        TueOT1.text = OT_Hours_[1]
        WedOT1.text = OT_Hours_[2]
        ThuOT1.text = OT_Hours_[3]
        FriOT1.text = OT_Hours_[4]
        SatOT1.text = OT_Hours_[5]
        MonOT2.text = OT_Hours_[6]
        TueOT2.text = OT_Hours_[7]
        WedOT2.text = OT_Hours_[8]
        ThuOT2.text = OT_Hours_[9]
        FriOT2.text = OT_Hours_[10]
        SatOT2.text = OT_Hours_[11]
        MonOT3.text = OT_Hours_[12]
        TueOT3.text = OT_Hours_[13]
        WedOT3.text = OT_Hours_[14]
        ThuOT3.text = OT_Hours_[15]
        FriOT3.text = OT_Hours_[16]
        SatOT3.text = OT_Hours_[17]
        MonOT4.text = OT_Hours_[18]
        TueOT4.text = OT_Hours_[19]
        WedOT4.text = OT_Hours_[20]
        ThuOT4.text = OT_Hours_[21]
        FriOT4.text = OT_Hours_[22]
        SatOT4.text = OT_Hours_[23]
        MonOT5.text = OT_Hours_[24]
        TueOT5.text = OT_Hours_[25]
        WedOT5.text = OT_Hours_[26]
        ThuOT5.text = OT_Hours_[27]
        FriOT5.text = OT_Hours_[28]
        SatOT5.text = OT_Hours_[29]
        MonOT6.text = OT_Hours_[30]
        TueOT6.text = OT_Hours_[31]
        WedOT6.text = OT_Hours_[32]
        ThuOT6.text = OT_Hours_[33]
        FriOT6.text = OT_Hours_[34]
        SatOT6.text = OT_Hours_[35]
        MonOT7.text = OT_Hours_[36]
        TueOT7.text = OT_Hours_[37]
        WedOT7.text = OT_Hours_[38]
        ThuOT7.text = OT_Hours_[39]
        FriOT7.text = OT_Hours_[40]
        SatOT7.text = OT_Hours_[41]
        MonOT8.text = OT_Hours_[42]
        TueOT8.text = OT_Hours_[43]
        WedOT8.text = OT_Hours_[44]
        ThuOT8.text = OT_Hours_[45]
        FriOT8.text = OT_Hours_[46]
        SatOT8.text = OT_Hours_[47]
        MonOT9.text = OT_Hours_[48]
        TueOT9.text = OT_Hours_[49]
        WedOT9.text = OT_Hours_[50]
        ThuOT9.text = OT_Hours_[51]
        FriOT9.text = OT_Hours_[52]
        SatOT9.text = OT_Hours_[53]
        MonOT10.text = OT_Hours_[54]
        TueOT10.text = OT_Hours_[55]
        WedOT10.text = OT_Hours_[56]
        ThuOT10.text = OT_Hours_[57]
        FriOT10.text = OT_Hours_[58]
        SatOT10.text = OT_Hours_[59]
        MonOT11.text = OT_Hours_[60]
        TueOT11.text = OT_Hours_[61]
        WedOT11.text = OT_Hours_[62]
        ThuOT11.text = OT_Hours_[63]
        FriOT11.text = OT_Hours_[64]
        SatOT11.text = OT_Hours_[65]
        MonOT12.text = OT_Hours_[66]
        TueOT12.text = OT_Hours_[67]
        WedOT12.text = OT_Hours_[68]
        ThuOT12.text = OT_Hours_[69]
        FriOT12.text = OT_Hours_[70]
        SatOT12.text = OT_Hours_[71]
        MonOT13.text = OT_Hours_[72]
        TueOT13.text = OT_Hours_[73]
        WedOT13.text = OT_Hours_[74]
        ThuOT13.text = OT_Hours_[75]
        FriOT13.text = OT_Hours_[76]
        SatOT13.text = OT_Hours_[77]
        MonOT14.text = OT_Hours_[78]
        TueOT14.text = OT_Hours_[79]
        WedOT14.text = OT_Hours_[80]
        ThuOT14.text = OT_Hours_[81]
        FriOT14.text = OT_Hours_[82]
        SatOT14.text = OT_Hours_[83]
        MonOT15.text = OT_Hours_[84]
        TueOT15.text = OT_Hours_[85]
        WedOT15.text = OT_Hours_[86]
        ThuOT15.text = OT_Hours_[87]
        FriOT15.text = OT_Hours_[88]
        SatOT15.text = OT_Hours_[89]
        
    }
    
    func DoubletimeSet() {
        SunDT1.text = DT_Hours_[0]
        SunDT2.text = DT_Hours_[1]
        SunDT3.text = DT_Hours_[2]
        SunDT4.text = DT_Hours_[3]
        SunDT5.text = DT_Hours_[4]
        SunDT6.text = DT_Hours_[5]
        SunDT7.text = DT_Hours_[6]
        SunDT8.text = DT_Hours_[7]
        SunDT9.text = DT_Hours_[8]
        SunDT10.text = DT_Hours_[9]
        SunDT11.text = DT_Hours_[10]
        SunDT12.text = DT_Hours_[11]
        SunDT13.text = DT_Hours_[12]
        SunDT14.text = DT_Hours_[13]
        SunDT15.text = DT_Hours_[14]
        
    }
    
}
