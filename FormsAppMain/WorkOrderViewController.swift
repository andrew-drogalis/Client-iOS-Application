//
//  WorkOrderViewController.swift
//  Pierpont1
//
//  Created by Andrew Drogalis on 3/27/22.
//

import UIKit
import PDFKit
import MessageUI

class WorkOrderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {
    var Customer_Data: [String] = [String]()
    var Mechanic_Names: [String] = [String]()
    var SavedForms_Dict: [String:[String]] = [String:[String]]()
    var Temp_Dict: [String:[String]] = [String:[String]]()
    var Temp_Images: [String:[UIImage]] = [String:[UIImage]]()
    var Temp_Signature: [String:[UIBezierPath]] = [String:[UIBezierPath]]()
    var Technician_sign_set = UIBezierPath()
    var Customer_sign_set = UIBezierPath()
    var Start_Name = ""
    var date_set = ""
    var job_type_set = ""
    var customer_label_set = ""
    var address_label_set = ""
    var customer_email_label_set = ""
    var job_number_set = ""
    var mechanic_main_set = ""
    var additional_email_set = ""
    var customer_manual_set = ""
    var address_manual_set = ""
    var email_manual_set = ""
    var make_set = ""
    var model_set = ""
    var serial_set = ""
    var description_performed_set = ""
    var materials_set = ""
    var recommendations_set = ""
    var image_description1_set = ""
    var image_description2_set = ""
    var image_description3_set = ""
    var image_button1_set = ""
    var image_button2_set = ""
    var image_button3_set = ""
    var customer_name_set = ""
    var teammember2_set = ""
    var teammember3_set = ""
    var teammember4_set = ""
    var addrow2_button_set = ""
    var addrow3_button_set = ""
    var addrow4_button_set = ""
    var labor_hours_array_set: [String] = [String]()
    var workNumber = "0000000"
    var current_orientation = ""; var previous_orientation = ""
    var viewHeight: CGFloat = 0.0
    var email_sent = 0
    var data = Data()
    var title_page: String = "WORK ORDER"
    var pickerViewCustomer = UIPickerView()
    var pickerViewMechanic = UIPickerView()
    let logo_image = UIImage(named: "pierpontlogowhiteback")
    var selectedImage1 = UIImage()
    var selectedImage2 = UIImage()
    var selectedImage3 = UIImage()
    var selectedRowCustomer = 0
    var selectedMainMechanic = 0
    var selectedTeamMember2 = 0
    var selectedTeamMember3 = 0
    var selectedTeamMember4 = 0
    var Company_Name = ""
    var Construction_DisplayName: [String] = [String]()
    var Maintenance_DisplayName: [String] = [String]()
    var Construction_Dict: [String:[String]] = [String:[String]]()
    var Maintenance_Dict: [String:[String]] = [String:[String]]()
    var Customer_Dict: [String:[String]] = [String:[String]]()
    let photoPicker = UIImagePickerController()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var JobTypebutton: UIButton!
    @IBOutlet weak var DescriptionWorkPerformed: UITextView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var MaterialsUsedText: UITextView!
    
    @IBOutlet weak var SelectCustomerlabel: UILabel!
    @IBOutlet weak var SelectCustomer: UIButton!
    @IBOutlet weak var SelectCustomerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var SelectCustomertext: UITextField!
    @IBOutlet weak var SelectMainMechanic: UIButton!
    @IBOutlet weak var SelectMainMechaniclabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var Addresstext: UITextField!
    @IBOutlet weak var AddressWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var CustomerEmail: UILabel!
    @IBOutlet weak var CustomerEmailtext: UITextField!
    @IBOutlet weak var CustomerEmailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var addEmailtext: UITextField!
    @IBOutlet weak var addEmaillabel: UILabel!
    
    @IBOutlet weak var CustomerName: UITextField!
    @IBOutlet weak var CustomerSignature: YPDrawSignatureView!
    @IBOutlet weak var TechnicianSignature: YPDrawSignatureView!
    
    @IBOutlet weak var workOrderNumber: UILabel!
    @IBOutlet weak var jobNumber: UILabel!
    @IBOutlet weak var jobNumberlabel: UILabel!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var makeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var maketext1: UITextField!
    @IBOutlet weak var makeWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var makelabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var modeltext1: UITextField!
    @IBOutlet weak var serialtext1: UITextField!
    @IBOutlet weak var serialWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var seriallabelRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var RecommendationsField: UITextView!
    
    @IBOutlet weak var ImageDescription1: UITextField!
    @IBOutlet weak var ImageDescription2: UITextField!
    @IBOutlet weak var ImageDescription3: UITextField!
    @IBOutlet weak var ImageButton1: UIButton!
    @IBOutlet weak var ImageButton2: UIButton!
    @IBOutlet weak var ImageButton3: UIButton!
    @IBOutlet weak var RemoveImage1: UIButton!
    @IBOutlet weak var RemoveImage2: UIButton!
    @IBOutlet weak var RemoveImage3: UIButton!
    
    @IBOutlet weak var teamMember1: UIButton!
    @IBOutlet weak var teamMember1label: UILabel!
    @IBOutlet weak var teamMember2: UIButton!
    @IBOutlet weak var teamMember2label: UILabel!
    @IBOutlet weak var teamMember3: UIButton!
    @IBOutlet weak var teamMember3label: UILabel!
    @IBOutlet weak var teamMember4: UIButton!
    @IBOutlet weak var teamMember4label: UILabel!
    
    @IBOutlet weak var Activatebutton2: UIButton!
    @IBOutlet weak var Activatebutton3: UIButton!
    @IBOutlet weak var Activatebutton4: UIButton!
    @IBOutlet weak var regHours1: UITextField!
    @IBOutlet weak var regHours2: UITextField!
    @IBOutlet weak var regHours3: UITextField!
    @IBOutlet weak var regHours4: UITextField!
    @IBOutlet weak var otHours1: UITextField!
    @IBOutlet weak var otHours2: UITextField!
    @IBOutlet weak var otHours3: UITextField!
    @IBOutlet weak var otHours4: UITextField!
    @IBOutlet weak var dtHours1: UITextField!
    @IBOutlet weak var dtHours2: UITextField!
    @IBOutlet weak var dtHours3: UITextField!
    @IBOutlet weak var dtHours4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DescriptionWorkPerformed.layer.borderWidth = 0.5
        DescriptionWorkPerformed.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        DescriptionWorkPerformed.layer.cornerRadius = 6
        MaterialsUsedText.layer.borderWidth = 0.5
        MaterialsUsedText.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        MaterialsUsedText.layer.cornerRadius = 6
        RecommendationsField.layer.borderWidth = 0.5
        RecommendationsField.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        RecommendationsField.layer.cornerRadius = 6
        DescriptionWorkPerformed.delegate = self; MaterialsUsedText.delegate = self; RecommendationsField.delegate = self
        DescriptionWorkPerformed.textContainer.maximumNumberOfLines = 9
        MaterialsUsedText.textContainer.maximumNumberOfLines = 9
        RecommendationsField.textContainer.maximumNumberOfLines = 7
        DescriptionWorkPerformed.textContainer.lineBreakMode = .byTruncatingTail
        MaterialsUsedText.textContainer.lineBreakMode = .byTruncatingTail
        RecommendationsField.textContainer.lineBreakMode = .byTruncatingTail
        CustomerSignature.layer.borderWidth = 0.5
        CustomerSignature.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        TechnicianSignature.layer.borderWidth = 0.5
        TechnicianSignature.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        Activatebutton2.setTitle("Add Row", for: .normal); Activatebutton3.setTitle("Add Row", for: .normal)
        Activatebutton4.setTitle("Add Row", for: .normal)
        // Do any additional setup after loading the view.
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: scrollView, action: #selector(UIView.endEditing(_:))))
        keyboardNotifications(); setUpButtonMenu(); rotateNotifications(); setupLabelTap(); JobNumberDisplay()
        self.viewHeight = viewHeightConstraint.constant
        pickerViewCustomer.dataSource = self; pickerViewCustomer.delegate = self; pickerViewCustomer.tag = 1
        pickerViewCustomer.frame = CGRect(x:0,y:0,width:760,height:300)
        pickerViewMechanic.dataSource = self; pickerViewMechanic.delegate = self; pickerViewMechanic.tag = 2
        pickerViewMechanic.frame = CGRect(x:0,y:0,width:440,height:200)
        // Set up Data
        Construction_DisplayName = Array(Construction_Dict.keys); Maintenance_DisplayName = Array(Maintenance_Dict.keys)
        Mechanic_Names.sort(); Construction_DisplayName.sort(); Maintenance_DisplayName.sort(); workOrderNumber.text = workNumber
        if Start_Name != "" {SendUpdates()}
        navigationController?.delegate = self
        
        if workOrderNumber.text == "0000000"{
            let alert = UIAlertController(title: "Work Order Number Error", message: "Please reconnect to the Internet.\nLocal work order # cache has been depleted.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
        
        if Construction_DisplayName.count == 0 || Maintenance_DisplayName.count == 0 || Mechanic_Names.count == 0{
            let alert = UIAlertController(title: "Database Loading Error", message: "Please confirm Internet Connection. Wait 10 seconds, and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let Customer_Name = SelectCustomerlabel.text!
        let labor_hours_array = [regHours1.text!,otHours1.text!,dtHours1.text!,regHours2.text!,otHours2.text!,dtHours2.text!,regHours3.text!,otHours3.text!,dtHours3.text!,regHours4.text!,otHours4.text!,dtHours4.text!]
        var TextFill = 0
        if DescriptionWorkPerformed.text! != "" || MaterialsUsedText.text! != "" || RecommendationsField.text! != "" || maketext1.text! != "" || modeltext1.text! != "" || serialtext1.text! != ""  {
            TextFill = 1
        }
        for Item in labor_hours_array{
            if Item != ""{TextFill = 1}
        }
        if ((Customer_Name != "SELECT CUSTOMER" && Customer_Name != "SELECT JOB TYPE") || TextFill == 1) && email_sent == 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: DatePicker.date)
            let Temp_Name = "WORK ORDER - \(Customer_Name) - \(date_input)"
            var base_array = ["WORKORDER",Temp_Name,date_input,JobTypebutton.titleLabel!.text!,SelectCustomerlabel.text!,self.Company_Name,AddressLabel.text!,CustomerEmail.text!,jobNumber.text!,SelectMainMechaniclabel.text!,self.workNumber,addEmailtext.text!,SelectCustomertext.text!,Addresstext.text!,CustomerEmailtext.text!,maketext1.text!,modeltext1.text!,serialtext1.text!,DescriptionWorkPerformed.text!,MaterialsUsedText.text!,RecommendationsField.text!,ImageDescription1.text!,ImageDescription2.text!,ImageDescription3.text!,ImageButton1.titleLabel!.text!,ImageButton2.titleLabel!.text!,ImageButton3.titleLabel!.text!,CustomerName.text!,teamMember2label.text!,teamMember3label.text!,teamMember4label.text!,Activatebutton2.titleLabel!.text!,Activatebutton3.titleLabel!.text!,Activatebutton4.titleLabel!.text!,"\(selectedRowCustomer)","\(selectedMainMechanic)","\(selectedTeamMember2)","\(selectedTeamMember3)","\(selectedTeamMember4)"]
            base_array += labor_hours_array
            Temp_Dict = [Temp_Name:base_array]
            Temp_Images = [Temp_Name:[selectedImage1,selectedImage2,selectedImage3]]
            Temp_Signature = [Temp_Name:[TechnicianSignature.path,CustomerSignature.path]]
            (viewController as? ViewController)?.Temp_Dict = Temp_Dict
            (viewController as? ViewController)?.Temp_Images = Temp_Images
            (viewController as? ViewController)?.Temp_Signature = Temp_Signature
            (viewController as? ViewController)?.mergeDictionarys()
            (viewController as? ViewController)?.refreshTabel() // UPDATE LOCAL SAVE
        }
        if email_sent == 1 && Start_Name != ""{
            (viewController as? ViewController)?.deleteSavedForm(name: Start_Name)
            (viewController as? ViewController)?.refreshTabel()
        }
        (viewController as? ViewController)?.WriteSaveFormsFiles()
        (viewController as? ViewController)?.SavePostFiles()
    }
    
    func SendUpdates(){
        let formater = DateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        let date = formater.date(from: date_set) ?? Date()
        DatePicker.setDate(date, animated: false)
        
        JobTypebutton?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == job_type_set {action.state = .on}
        }
        SelectCustomerlabel.text = customer_label_set
        AddressLabel.text = address_label_set
        CustomerEmail.text = customer_email_label_set
        jobNumber.text = job_number_set
        SelectMainMechaniclabel.text = mechanic_main_set
        teamMember1label.text = mechanic_main_set
        addEmailtext.text = additional_email_set
        SelectCustomertext.text = customer_manual_set
        Addresstext.text = address_manual_set
        CustomerEmailtext.text = email_manual_set
        maketext1.text = make_set
        modeltext1.text = model_set
        serialtext1.text = serial_set
        DescriptionWorkPerformed.text = description_performed_set
        MaterialsUsedText.text = materials_set
        RecommendationsField.text = recommendations_set
        ImageDescription1.text = image_description1_set
        ImageDescription2.text = image_description2_set
        ImageDescription3.text = image_description3_set
        
        var image_error = ""
        let font_attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .medium)]
        if image_button1_set == "Image Saved" && self.selectedImage1.size.width == 0 {
            image_error += "Image #1\n"
        } else if image_button1_set == "Image Saved" && self.selectedImage1.size.width != 0 {
            ImageButton1.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        if image_button2_set == "Image Saved" && self.selectedImage2.size.width == 0 {
            image_error += "Image #2\n"
        } else if image_button2_set == "Image Saved" && self.selectedImage2.size.width != 0 {
            ImageButton2.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        if image_button3_set == "Image Saved" && self.selectedImage3.size.width == 0 {
            image_error += "Image #3\n"
        } else if image_button3_set == "Image Saved" && self.selectedImage3.size.width != 0 {
            ImageButton3.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        CustomerName.text = customer_name_set
        teamMember2label.text = teammember2_set
        teamMember3label.text = teammember3_set
        teamMember4label.text = teammember4_set
        
        if addrow2_button_set == "Add Row" {
            regHours2.isHidden = true; otHours2.isHidden = true; dtHours2.isHidden = true
            teamMember2.isHidden = true; teamMember2label.isHidden = true
        }
        else{
            Activatebutton2.setTitle("Remove Row", for: .normal)
            regHours2.isHidden = false; otHours2.isHidden = false; dtHours2.isHidden = false
            teamMember2.isHidden = false; teamMember2label.isHidden = false
        }
        if addrow3_button_set == "Add Row" {
            regHours3.isHidden = true; otHours3.isHidden = true; dtHours3.isHidden = true
            teamMember3.isHidden = true; teamMember3label.isHidden = true
        }
        else{
            Activatebutton3.setTitle("Remove Row", for: .normal)
            regHours3.isHidden = false; otHours3.isHidden = false; dtHours3.isHidden = false
            teamMember3.isHidden = false; teamMember3label.isHidden = false
        }

        if addrow4_button_set == "Add Row" {
            regHours4.isHidden = true; otHours4.isHidden = true; dtHours4.isHidden = true
            teamMember4.isHidden = true; teamMember4label.isHidden = true
        }
        else{
            Activatebutton4.setTitle("Remove Row", for: .normal)
            regHours4.isHidden = false; otHours4.isHidden = false; dtHours4.isHidden = false
            teamMember4.isHidden = false; teamMember4label.isHidden = false
        }
        
        let labor_hours_array = [regHours1,otHours1,dtHours1,regHours2,otHours2,dtHours2,regHours3,otHours3,dtHours3,regHours4,otHours4,dtHours4]
        
        for i in 0...11{
            labor_hours_array[i]?.text = labor_hours_array_set[i]
        }
        
        Customer_sign_set.lineWidth = 2.5; Technician_sign_set.lineWidth = 2.5
        CustomerSignature.path = Customer_sign_set
        TechnicianSignature.path = Technician_sign_set
        JobNumberDisplay()
        if image_error != "" {
            let alert = UIAlertController(title: "Image Attachment Failed", message: "\(image_error)\nPlease add Images from Photo Library", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func localSave(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let SavedForms_Data_Path = documentDirectory[0].appendingPathComponent("Saved-Forms-Data.txt")
        let labor_hours_array = [regHours1.text!,otHours1.text!,dtHours1.text!,regHours2.text!,otHours2.text!,dtHours2.text!,regHours3.text!,otHours3.text!,dtHours3.text!,regHours4.text!,otHours4.text!,dtHours4.text!]
        var TextFill = 0
        if DescriptionWorkPerformed.text! != "" || MaterialsUsedText.text! != "" || RecommendationsField.text! != "" || maketext1.text! != "" || modeltext1.text! != "" || serialtext1.text! != ""  {
            TextFill = 1
        }
        for Item in labor_hours_array{
            if Item != ""{TextFill = 1}
        }
        let Customer_Name = SelectCustomerlabel.text!
        if (Customer_Name != "SELECT CUSTOMER" && Customer_Name != "SELECT JOB TYPE") || TextFill == 1{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: DatePicker.date)
            let Temp_Name = "WORK ORDER - \(Customer_Name) - \(date_input)"
  
            var base_array = ["WORKORDER",Temp_Name,date_input,JobTypebutton.titleLabel!.text!,SelectCustomerlabel.text!,self.Company_Name,AddressLabel.text!,CustomerEmail.text!,jobNumber.text!,SelectMainMechaniclabel.text!,self.workNumber,addEmailtext.text!,SelectCustomertext.text!,Addresstext.text!,CustomerEmailtext.text!,maketext1.text!,modeltext1.text!,serialtext1.text!,DescriptionWorkPerformed.text!,MaterialsUsedText.text!,RecommendationsField.text!,ImageDescription1.text!,ImageDescription2.text!,ImageDescription3.text!,ImageButton1.titleLabel!.text!,ImageButton2.titleLabel!.text!,ImageButton3.titleLabel!.text!,CustomerName.text!,teamMember2label.text!,teamMember3label.text!,teamMember4label.text!,Activatebutton2.titleLabel!.text!,Activatebutton3.titleLabel!.text!,Activatebutton4.titleLabel!.text!,"\(selectedRowCustomer)","\(selectedMainMechanic)","\(selectedTeamMember2)","\(selectedTeamMember3)","\(selectedTeamMember4)"]
            base_array += labor_hours_array
            Temp_Dict = [Temp_Name:base_array]
            
            SavedForms_Dict = SavedForms_Dict.merging(Temp_Dict) {(_,new) in new}
            let jsonData = try? JSONEncoder().encode(self.SavedForms_Dict)
            let jsonString = String(data: jsonData!, encoding: .utf8)
            
            let outputStream = OutputStream(url:  SavedForms_Data_Path, append: false)
            outputStream?.open()
            outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
            outputStream?.close()
        }
    }
    
    @IBAction func LocalSaveData(_ sender: Any) {
        localSave()
    }
        
    func setUpButtonMenu(){
        let optionClosure = {(action:UIAction) in self.JobNumberDisplay()}
        
        JobTypebutton.menu = UIMenu(children: [
            UIAction(title:"Select Job Type",handler:optionClosure),
            UIAction(title:"Maintenance",handler:optionClosure),
            UIAction(title:"Construction",handler:optionClosure),
            UIAction(title:"Proposal",handler:optionClosure),
            UIAction(title:"Emergency Service",handler:optionClosure),
            UIAction(title:"Manual Entry",handler:optionClosure)])
        JobTypebutton.showsMenuAsPrimaryAction = true
        JobTypebutton.changesSelectionAsPrimaryAction = true
        
    }
    
    func JobNumberDisplay(){
        let name = JobTypebutton.menu?.selectedElements.first?.title

        if name == "Construction" {
            jobNumber.isHidden = false; jobNumberlabel.isHidden = false
            Customer_Data = Construction_DisplayName; Customer_Dict = Construction_Dict
        }
        else if name == "Select Job Type" {
            jobNumber.isHidden = true; jobNumberlabel.isHidden = true
            Customer_Data = ["Select Job Type"]; Customer_Dict = ["Select Job Type":["Empty Name","Empty Address","Email Recipients","000-00"]]
        }
        else {
            if name == "Manual Entry" {
                jobNumber.isHidden = true; jobNumberlabel.isHidden = true
            }
            else {
                jobNumber.isHidden = false; jobNumberlabel.isHidden = false
            }
            Customer_Data = Maintenance_DisplayName; Customer_Dict = Maintenance_Dict
        }
            
        if name == "Manual Entry" {
            addEmailtext.isHidden = true; addEmaillabel.isHidden = true; SelectCustomerlabel.isHidden = true
            SelectCustomer.isHidden = true; AddressLabel.isHidden = true; CustomerEmail.isHidden = true
            SelectCustomertext.isHidden = false; Addresstext.isHidden = false; CustomerEmailtext.isHidden = false
            makeViewTopConstraint.constant = 16
            viewHeightConstraint.constant = 1900
            self.viewHeight = viewHeightConstraint.constant
        } else {
            addEmailtext.isHidden = false; addEmaillabel.isHidden = false; SelectCustomerlabel.isHidden = false
            SelectCustomer.isHidden = false; AddressLabel.isHidden = false; CustomerEmail.isHidden = false
            SelectCustomertext.isHidden = true; Addresstext.isHidden = true; CustomerEmailtext.isHidden = true
            makeViewTopConstraint.constant = 56
            viewHeightConstraint.constant = 1940
            self.viewHeight = viewHeightConstraint.constant
        }
        
    }
    
    func ActualCustomerDropDown(){
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:780,height: 300)
        let alert = UIAlertController(title: "SELECT CUSTOMER", message: "Customer Address and Email will update once selected.", preferredStyle: .actionSheet)
        pickerViewCustomer.selectRow(selectedRowCustomer,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewCustomer)
        pickerViewCustomer.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewCustomer.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = SelectCustomerlabel
        alert.popoverPresentationController?.sourceRect = SelectCustomerlabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            self.selectedRowCustomer = self.pickerViewCustomer.selectedRow(inComponent: 0)
            let display_name = self.Customer_Data[self.selectedRowCustomer]
            self.SelectCustomerlabel.text = display_name.uppercased()
            self.Company_Name = self.Customer_Dict[display_name]?[0].uppercased() ?? ""
            self.AddressLabel.text = self.Customer_Dict[display_name]?[1].uppercased()
            if self.JobTypebutton.titleLabel?.text == "Proposal" {
                self.CustomerEmail.text = "dispatch@pierpontmech.com".uppercased()
            } else {
                self.CustomerEmail.text = self.Customer_Dict[display_name]?[2].uppercased()}
            self.jobNumber.text = self.Customer_Dict[display_name]?[3]
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func SelectCustomerDropDown(_ sender: Any) {ActualCustomerDropDown()}
    
    @objc func CustomerLabelDropDown(sender: UITapGestureRecognizer) {ActualCustomerDropDown()}
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(CustomerLabelDropDown))
        SelectCustomerlabel.isUserInteractionEnabled = true
        SelectCustomerlabel.addGestureRecognizer(labelTap)
        
        let labelTap2 = UITapGestureRecognizer(target: self, action: #selector(MechanicLabelDropDown))
        SelectMainMechaniclabel.isUserInteractionEnabled = true
        SelectMainMechaniclabel.addGestureRecognizer(labelTap2)
        
        let labelTap3 = UITapGestureRecognizer(target: self, action: #selector(TeamMemberLabelDropDown))
        teamMember1label.isUserInteractionEnabled = true
        teamMember1label.addGestureRecognizer(labelTap3)
        
        let labelTap4 = UITapGestureRecognizer(target: self, action: #selector(TeamMemberLabelDropDown))
        teamMember2label.isUserInteractionEnabled = true
        teamMember2label.addGestureRecognizer(labelTap4)
        
        let labelTap5 = UITapGestureRecognizer(target: self, action: #selector(TeamMemberLabelDropDown))
        teamMember3label.isUserInteractionEnabled = true
        teamMember3label.addGestureRecognizer(labelTap5)
        
        let labelTap6 = UITapGestureRecognizer(target: self, action: #selector(TeamMemberLabelDropDown))
        teamMember4label.isUserInteractionEnabled = true
        teamMember4label.addGestureRecognizer(labelTap6)
    }
    
    @objc func MechanicLabelDropDown(sender: UITapGestureRecognizer) {ActualMechanicDropDown()}
    
    @IBAction func MainMechanicDropDown(_ sender: Any) {
        ActualMechanicDropDown()
    }
    
    func ActualMechanicDropDown() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:450,height: 200)
        let alert = UIAlertController(title: "Select Primary Mechanic", message: "", preferredStyle: .actionSheet)
        pickerViewMechanic.selectRow(selectedMainMechanic,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewMechanic)
        pickerViewMechanic.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewMechanic.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        print(self.workNumber)
        alert.popoverPresentationController?.sourceView = SelectMainMechaniclabel
        alert.popoverPresentationController?.sourceRect = SelectMainMechaniclabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            self.selectedMainMechanic = self.pickerViewMechanic.selectedRow(inComponent: 0)
            let name = self.Mechanic_Names[self.selectedMainMechanic].uppercased()
            self.SelectMainMechaniclabel.text = name
            self.teamMember1label.text = name
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func TeamMemberDropDown(_ sender: UIButton) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:450,height: 200)
        var message_text = ""; var teamLabel = UILabel()
        var local_selected = 0
        if sender == teamMember1 {
            message_text = "#1"; local_selected = selectedMainMechanic; teamLabel = teamMember1label
        } else if sender == teamMember2 {
            message_text = "#2"; local_selected = selectedTeamMember2; teamLabel = teamMember2label
        } else if sender == teamMember3 {
            message_text = "#3"; local_selected = selectedTeamMember3; teamLabel = teamMember3label
        } else if sender == teamMember4 {
            message_text = "#4"; local_selected = selectedTeamMember4; teamLabel = teamMember4label
        }
        let alert = UIAlertController(title: "Select Mechanic \(message_text)", message: "", preferredStyle: .actionSheet)
        pickerViewMechanic.selectRow(local_selected,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewMechanic)
        pickerViewMechanic.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewMechanic.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = teamLabel
        alert.popoverPresentationController?.sourceRect = teamLabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            local_selected = self.pickerViewMechanic.selectedRow(inComponent: 0)
            let name = self.Mechanic_Names[local_selected].uppercased()
            if sender == self.SelectMainMechanic || sender == self.teamMember1 {
                self.SelectMainMechaniclabel.text = name
                self.teamMember1label.text = name
                self.selectedMainMechanic = local_selected
            } else {
                teamLabel.text = name
                if sender == self.teamMember2 {
                    self.selectedTeamMember2 = local_selected
                } else if sender == self.teamMember3 {
                    self.selectedTeamMember3 = local_selected
                } else if sender == self.teamMember4 {
                    self.selectedTeamMember4 = local_selected
                }
            }
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func TeamMemberLabelDropDown(sender: UITapGestureRecognizer) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:450,height: 200)
        var message_text = ""; var teamLabel = UILabel()
        var local_selected = 0
        if sender.view == teamMember1label {
            message_text = "#1"; local_selected = selectedMainMechanic; teamLabel = teamMember1label
        } else if sender.view == teamMember2label {
            message_text = "#2"; local_selected = selectedTeamMember2; teamLabel = teamMember2label
        } else if sender.view == teamMember3label {
            message_text = "#3"; local_selected = selectedTeamMember3; teamLabel = teamMember3label
        } else if sender.view == teamMember4label {
            message_text = "#4"; local_selected = selectedTeamMember4; teamLabel = teamMember4label
        }
        let alert = UIAlertController(title: "Select Mechanic \(message_text)", message: "", preferredStyle: .actionSheet)
        pickerViewMechanic.selectRow(local_selected,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewMechanic)
        pickerViewMechanic.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewMechanic.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = teamLabel
        alert.popoverPresentationController?.sourceRect = teamLabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            local_selected = self.pickerViewMechanic.selectedRow(inComponent: 0)
            let name = self.Mechanic_Names[local_selected].uppercased()
            if sender.view == self.teamMember1label {
                self.SelectMainMechaniclabel.text = name
                self.teamMember1label.text = name
                self.selectedMainMechanic = local_selected
            } else {
                teamLabel.text = name
                if sender.view == self.teamMember2label {
                    self.selectedTeamMember2 = local_selected
                } else if sender.view == self.teamMember3label {
                    self.selectedTeamMember3 = local_selected
                } else if sender.view == self.teamMember4label {
                    self.selectedTeamMember4 = local_selected
                }
            }
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    func ImageTouched() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:500,height:1)
        let actionSheet = UIAlertController(title: "SELECT PHOTO", message: "Where do you want to select a photo?", preferredStyle: .actionSheet)
        
        if self.photoPicker.view.tag == 1 {
            actionSheet.popoverPresentationController?.sourceView = ImageButton1
            actionSheet.popoverPresentationController?.sourceRect = ImageButton1.bounds
        }
        if self.photoPicker.view.tag == 2 {
            actionSheet.popoverPresentationController?.sourceView = ImageButton2
            actionSheet.popoverPresentationController?.sourceRect = ImageButton2.bounds
        }
        if self.photoPicker.view.tag == 3 {
            actionSheet.popoverPresentationController?.sourceView = ImageButton3
            actionSheet.popoverPresentationController?.sourceRect = ImageButton3.bounds
        }
        self.photoPicker.delegate = self; self.photoPicker.allowsEditing = true
        actionSheet.setValue(vc, forKey: "contentViewController")
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                self.photoPicker.sourceType = .photoLibrary
                self.present(self.photoPicker, animated: true, completion: nil)}
        })
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.photoPicker.sourceType = .camera
                self.present(self.photoPicker, animated: true, completion: nil)}
        })
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func clearTechician(_ sender: Any) {TechnicianSignature.clear()}
    
    @IBAction func clearCustomer(_ sender: Any) {CustomerSignature.clear()}
    
    @objc func orientationChanged(_ notification: NSNotification) {
        let current_width = UIScreen.main.bounds.size.width
        let current_height = UIScreen.main.bounds.size.height
        let isFlat = UIDevice.current.orientation.isFlat
        let isPortrait = UIDevice.current.orientation.isPortrait
        if isFlat{self.current_orientation = "Flat"}
        else if isPortrait{self.current_orientation = "Portrait"}
        else {self.current_orientation = "Landscape"}
        if (previous_orientation == "Landscape" && (current_orientation == "Landscape" || current_orientation == "Flat")) || (previous_orientation == "Portrait" && (current_orientation == "Portrait" || current_orientation == "Flat")){
            let use_width = (current_width - 120) / 3
            let offset_length = (use_width/2) + 20
            makeWidthConstraint.constant = use_width
            serialWidthConstraint.constant = use_width
            seriallabelRightConstraint.constant = offset_length - (91/2) // half label width
            makelabelLeftConstraint.constant = offset_length - (62.5/2)
            SelectCustomerWidthConstraint.constant = current_width - 370
            AddressWidthConstraint.constant = current_width - 230
            CustomerEmailWidthConstraint.constant = current_width - 310
        }
        else {
            previous_orientation = current_orientation
            let use_width = (current_height - 120) / 3
            let offset_length = (use_width/2) + 20
            makeWidthConstraint.constant = use_width
            serialWidthConstraint.constant = use_width
            seriallabelRightConstraint.constant = offset_length - (91/2) // half label width
            makelabelLeftConstraint.constant = offset_length - (62.5/2)
            SelectCustomerWidthConstraint.constant = current_height - 370
            AddressWidthConstraint.constant = current_height - 230
            CustomerEmailWidthConstraint.constant = current_height - 310
        }
    }
    
    func rotateNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        let current_width = UIScreen.main.bounds.size.width
        let current_height = UIScreen.main.bounds.size.height
        if current_width > current_height {self.previous_orientation = "Landscape"}
        else if current_width < current_height {self.previous_orientation = "Portrait"}
        let use_width = (current_width - 120) / 3
        let offset_length = (use_width/2) + 20
        makeWidthConstraint.constant = use_width
        serialWidthConstraint.constant = use_width
        seriallabelRightConstraint.constant = offset_length - (91/2) // half label width
        makelabelLeftConstraint.constant = offset_length - (62.5/2)
        SelectCustomerWidthConstraint.constant = current_width - 370
        AddressWidthConstraint.constant = current_width - 230
        CustomerEmailWidthConstraint.constant = current_width - 310
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
    
    
    @IBAction func TeamMemberActivate(_ sender: UIButton) {
        let font_attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .regular)]
        let add_row_tittle = NSMutableAttributedString(string:"Add Row", attributes: font_attributes)
        let remove_row_tittle = NSMutableAttributedString(string:"Remove Row", attributes: font_attributes)
        
        if sender == Activatebutton2{
            if sender.currentAttributedTitle == remove_row_tittle {
                sender.setAttributedTitle(add_row_tittle, for: .normal)
                regHours2.isHidden = true; otHours2.isHidden = true; dtHours2.isHidden = true
                teamMember2.isHidden = true; teamMember2label.isHidden = true
            }
            else{
                sender.setAttributedTitle(remove_row_tittle, for: .normal)
                regHours2.isHidden = false; otHours2.isHidden = false; dtHours2.isHidden = false
                teamMember2.isHidden = false; teamMember2label.isHidden = false
            }
        } else if sender == Activatebutton3{
            if sender.currentAttributedTitle == remove_row_tittle {
                sender.setAttributedTitle(add_row_tittle, for: .normal)
                regHours3.isHidden = true; otHours3.isHidden = true; dtHours3.isHidden = true
                teamMember3.isHidden = true; teamMember3label.isHidden = true
            }
            else{
                sender.setAttributedTitle(remove_row_tittle, for: .normal)
                regHours3.isHidden = false; otHours3.isHidden = false; dtHours3.isHidden = false
                teamMember3.isHidden = false; teamMember3label.isHidden = false
            }
        } else if sender == Activatebutton4{
            if sender.currentAttributedTitle == remove_row_tittle {
                sender.setAttributedTitle(add_row_tittle, for: .normal)
                regHours4.isHidden = true; otHours4.isHidden = true; dtHours4.isHidden = true
                teamMember4.isHidden = true; teamMember4label.isHidden = true
            }
            else{
                sender.setAttributedTitle(remove_row_tittle, for: .normal)
                regHours4.isHidden = false; otHours4.isHidden = false; dtHours4.isHidden = false
                teamMember4.isHidden = false; teamMember4label.isHidden = false
            }
        }
    }
    
    @IBAction func SelectImage1Action(_ sender: Any) {
        self.photoPicker.view.tag = 1
        ImageTouched()
    }
    
    @IBAction func SelectImage2Action(_ sender: Any) {
        self.photoPicker.view.tag = 2
        ImageTouched()
    }
    
    @IBAction func SelectImage3Action(_ sender: Any) {
        self.photoPicker.view.tag = 3
        ImageTouched()
    }
    
    @IBAction func RemoveImage1(_ sender: Any) {
        let font_attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0, weight: .regular)]
        self.selectedImage1 = UIImage()
        ImageButton1.setAttributedTitle(NSMutableAttributedString(string:"Select Image", attributes: font_attributes), for: .normal)
    }
    
    @IBAction func RemoveImage2(_ sender: Any) {
        let font_attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0, weight: .regular)]
        self.selectedImage2 = UIImage()
        ImageButton2.setAttributedTitle(NSMutableAttributedString(string:"Select Image", attributes: font_attributes), for: .normal)
    }
    
    @IBAction func RemoveImage3(_ sender: Any) {
        let font_attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0, weight: .regular)]
        self.selectedImage3 = UIImage()
        ImageButton3.setAttributedTitle(NSMutableAttributedString(string:"Select Image", attributes: font_attributes), for: .normal)
    }
    
    func createFlyer() -> Data {
        // 1
        let author = SelectMainMechaniclabel.text
        let job_type = JobTypebutton.titleLabel?.text!
        let display_name = SelectCustomerlabel.text!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date_input = dateFormatter.string(from: DatePicker.date)
        let title = "Pierpont_Mechanical_" + self.title_page + "_\(date_input)"
        let pdfMetaData = [
            kCGPDFContextCreator: display_name,
            kCGPDFContextAuthor: author,
            kCGPDFContextTitle: title,
            kCGPDFContextSubject: job_type
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        // Page Setup
        let pageWidth = 11 * 72.0
        let pageHeight = 8.5 * 72.0
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
                rect = CGRect(x: 20, y: 75, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: 105, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: 245, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: 385, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: 505, width: 750, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 337, y: 585, width: 433, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: 585, width: 280, height: 13)
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
            let imageRect = CGRect(x: 18, y: 13, width: scaledWidth, height: scaledHeight)
            // 5
            self.logo_image?.draw(in: imageRect)
          
            let address1 = "250 Fulton Avenue"
            let address2 = "Garden City Park, NY 11040"
            let address3 = "Phone (516)746-7300"
            let address4 = "Fax (516)746-7302"
          
            var attributes = [NSAttributedString.Key.font: UIFont(name:"SerifGothicRegular",size: 8)]
            address1.draw(at: CGPoint(x: 168, y: 17), withAttributes: attributes as [NSAttributedString.Key : Any])
            address2.draw(at: CGPoint(x: 168, y: 27), withAttributes: attributes as [NSAttributedString.Key : Any])
            address3.draw(at: CGPoint(x: 168, y: 37), withAttributes: attributes as [NSAttributedString.Key : Any])
            address4.draw(at: CGPoint(x: 168, y: 47), withAttributes: attributes as [NSAttributedString.Key : Any])
          
            // 1
            let titleFont = UIFont(name: "AlegreyaSansSC-Black", size: 28.0)
            var titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont]
            var attributedTitle = NSAttributedString(string: self.title_page, attributes: titleAttributes)
            let titleStringSize = attributedTitle.size()
            var titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                      y: 12, width: titleStringSize.width, height: titleStringSize.height)
            attributedTitle.draw(in: titleStringRect)
            
            attributes = [NSAttributedString.Key.font: UIFont(name:"AlegreyaSansSC-Bold",size: 11)]
            let attributes_small = [NSAttributedString.Key.font: UIFont(name:"Roboto-Bold",size: 10)]
            let attributes_white = [NSAttributedString.Key.font: UIFont(name:"AlegreyaSansSC-Bold",size: 11), NSAttributedString.Key.foregroundColor : UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1)]
            var textFont = [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)]
            var header_bold = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 9.0)]
            var header = [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 9.0)]
            
            let label1 = "LABOR HOURS"
            let label2 = "CUSTOMER:"
            let label3 = "ADDRESS:"
            let label4 = "JOB#:"
            let label5 = "DATE:"
            let label6 = "WORK ORDER#:"
            let label7 = "DESCRIPTION OF WORK PERFORMED:"
            let label8 = "RECOMMENDATIONS / MATERIALS REQUIRED:"
            let label9 = "MAKE"
            let label10 = "MODEL#"
            let label11 = "SERIAL#"
            let label12 = "TECHNICIAN:"
            let label13 = "MATERIALS USED:"
            let label14 = "MECHANICS"
            let label15 = "REG."
            let label16 = "O.T."
            let label17 = "D.T."
            let label18 = "TECHNICIAN SIGNATURE"
            let label19 = "CUSTOMER SIGNATURE"
            let label20 = "CUSTOMER:"
            let label21 = "ACKNOWLEDGEMENT OF WORK PERFORMED"
    
            // Right Info
            var base = 15
            var height = 12
            label2.draw(at: CGPoint(x: 535, y: base), withAttributes: header_bold as [NSAttributedString.Key : Any])
            label3.draw(at: CGPoint(x: 535, y: base+(height)), withAttributes: header_bold as [NSAttributedString.Key : Any])
            label6.draw(at: CGPoint(x: 535, y: base+(height*2)), withAttributes: header_bold as [NSAttributedString.Key : Any])
            workNumber.draw(at: CGPoint(x: 603, y: base+(height*2)), withAttributes: header as [NSAttributedString.Key : Any])
            label5.draw(at: CGPoint(x: 535, y: base+(height*3)), withAttributes: header_bold as [NSAttributedString.Key : Any])
            date_input.draw(at: CGPoint(x: 563, y: base+(height*3)), withAttributes: header as [NSAttributedString.Key : Any])
                // Right Justified
            let job_type = JobTypebutton.titleLabel?.text
            if job_type != "Manual Entry"{
                label4.draw(at: CGPoint(x: 708, y: base+(height*3)), withAttributes: header_bold as [NSAttributedString.Key : Any])
                jobNumber.text?.draw(at: CGPoint(x: 736, y: base+(height*3)), withAttributes: header as [NSAttributedString.Key : Any])
            }
            
            // Unit Info
            label9.draw(at: CGPoint(x: 25, y: 75), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label10.draw(at: CGPoint(x: 275, y: 75), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label11.draw(at: CGPoint(x: 535, y: 75), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            
            base = 105
            var offset = 140
            label7.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label13.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            
            label8.draw(at: CGPoint(x: 25, y: base+(offset*2)), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            // Labor Hours
            let Main_Mechanic = SelectMainMechaniclabel.text
            base = 505; height = 15
            label14.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            Main_Mechanic?.draw(at: CGPoint(x: 25, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
            label15.draw(at: CGPoint(x: 170, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label16.draw(at: CGPoint(x: 215, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label17.draw(at: CGPoint(x: 260, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label21.draw(at: CGPoint(x: 340, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
      
            let reg1 = round((Float(truncating:NumberFormatter().number(from: regHours1.text!) ?? 0)))
            let ot1 = round((Float(truncating:NumberFormatter().number(from: otHours1.text!) ?? 0)))
            let dt1 = round((Float(truncating:NumberFormatter().number(from: dtHours1.text!) ?? 0)))
            
            "\(reg1)".draw(at: CGPoint(x: 170, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
            "\(ot1)".draw(at: CGPoint(x: 215, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
            "\(dt1)".draw(at: CGPoint(x: 260, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
     
            let add_mechanic_array = [Activatebutton2,Activatebutton3,Activatebutton4]
            let mechanic_array = [teamMember2label,teamMember3label,teamMember4label]
            let reg_array = [regHours2.text!,regHours3.text!,regHours4.text!]
            let ot_array = [otHours2.text!,otHours3.text!,otHours4.text!]
            let dt_array = [dtHours2.text!,dtHours3.text!,dtHours4.text!]
            
            height = 30
            for i in 0...2 {
                let button_name = add_mechanic_array[i]?.titleLabel?.text
                let team_member = mechanic_array[i]?.text
                if button_name != "Add Row" && team_member != "SELECT MECHANIC"{
                    team_member?.draw(at: CGPoint(x: 25, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                    let reg1 = round((Float(truncating:NumberFormatter().number(from: reg_array[i]) ?? 0)))
                    let ot1 = round((Float(truncating:NumberFormatter().number(from: ot_array[i]) ?? 0)))
                    let dt1 = round((Float(truncating:NumberFormatter().number(from: dt_array[i]) ?? 0)))
                    "\(reg1)".draw(at: CGPoint(x: 170, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(ot1)".draw(at: CGPoint(x: 215, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(dt1)".draw(at: CGPoint(x: 260, y: base+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                    height += 15
                }
            }
                                 
            // Customer & Technician
            base = 520; offset = 65
            label12.draw(at: CGPoint(x: 340, y: base), withAttributes: attributes_small as [NSAttributedString.Key : Any])
            Main_Mechanic?.draw(at: CGPoint(x: 405, y: base), withAttributes: textFont as [NSAttributedString.Key : Any])
            label20.draw(at: CGPoint(x: 555, y: base), withAttributes: attributes_small as [NSAttributedString.Key : Any])
            CustomerName.text?.uppercased().draw(at: CGPoint(x: 613, y: base), withAttributes: textFont as [NSAttributedString.Key : Any])
            label18.draw(at: CGPoint(x: 340, y: base+offset), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label19.draw(at: CGPoint(x: 555, y: base+offset), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            label1.draw(at: CGPoint(x: 170, y: base+offset), withAttributes: attributes_white as [NSAttributedString.Key : Any])
            
            
            // Truncating Paragraph
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byClipping
            var textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
            ]
            let make = NSAttributedString(string: self.maketext1.text ?? "", attributes: textAttributes)
            let model = NSAttributedString(string: self.modeltext1.text ?? "", attributes: textAttributes)
            let serial = NSAttributedString(string: self.serialtext1.text ?? "", attributes: textAttributes)
            make.draw(in: CGRect(x: 25, y: 90, width: 225, height: 20))
            model.draw(in: CGRect(x: 275, y: 90, width: 225, height: 20))
            serial.draw(in: CGRect(x: 535, y: 90, width: 215, height: 20))
            
            textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 9.0)
            ]
            var customer = NSAttributedString(); var address = NSAttributedString()
            if job_type == "Manual Entry"{
                customer = NSAttributedString(string: self.SelectCustomertext.text?.uppercased() ?? "", attributes: textAttributes)
                address = NSAttributedString(string: self.Addresstext.text?.uppercased() ?? "", attributes: textAttributes)
            } else{
                customer = NSAttributedString(string: self.Company_Name, attributes: textAttributes)
                address = NSAttributedString(string: self.AddressLabel.text ?? "", attributes: textAttributes)
            }
            
            customer.draw(in: CGRect(x: 589, y: 15, width: 180, height: 20))
            address.draw(in: CGRect(x: 580, y: 27, width: 190, height: 20))

            // 2
            paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byWordWrapping
            // 3
            textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
            ]
            let Description_Work = NSAttributedString(string: self.DescriptionWorkPerformed.text, attributes: textAttributes)
            let Material = NSAttributedString(string: self.MaterialsUsedText.text, attributes: textAttributes)
            let Recommendations = NSAttributedString(string: self.RecommendationsField.text, attributes: textAttributes)
            // 4
            Description_Work.draw(in: CGRect(x: 25, y: 120, width: 745, height: 120))
            Material.draw(in: CGRect(x: 25, y: 260, width: 745, height: 120))
            Recommendations.draw(in: CGRect(x: 25, y: 400, width: 745, height: 100))
            
            if CustomerSignature.doesContainSignature {
                let customer_sign = CustomerSignature.getCroppedSignature()
                let signature_rect = CGRect(x: 590, y: 537,width: customer_sign!.size.width*0.35, height: customer_sign!.size.height*0.34)
                customer_sign?.draw(in: signature_rect)
            }
            
            if TechnicianSignature.doesContainSignature {
                let technician_sign = TechnicianSignature.getCroppedSignature()
                let signature_rect = CGRect(x: 380, y: 537,width: technician_sign!.size.width*0.35, height: technician_sign!.size.height*0.34)
                technician_sign?.draw(in: signature_rect)
            }
            
            // IMAGE PAGE TITLE
            titleAttributes = [NSAttributedString.Key.font: UIFont(name: "AlegreyaSansSC-ExtraBold", size: 20.0)]
            attributedTitle = NSAttributedString(string: "IMAGE APPENDIX", attributes: titleAttributes)
            titleStringRect = CGRect(x: 20,y: 12, width: 200, height: 20)
            base = 12

            if self.selectedImage1.size.width != 0{
                context.beginPage()
 
                let width_img = Double(selectedImage1.size.width)
                let height_img = Double(selectedImage1.size.height)
                let width_ratio = 700 / width_img
                let heigth_ratio = 480 / height_img
                let scale = min(width_ratio,heigth_ratio)
                let x_cord = (pageWidth - width_img*scale)/2
                let y_cord = (pageHeight - height_img*scale)/2 + 50
                if let graphic_context = UIGraphicsGetCurrentContext(){
                    graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                    var rect = CGRect(x: 0, y: 0, width: 792, height: 612)
                    graphic_context.fill(rect)
                    graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                    rect = CGRect(x: 20, y: 40, width: 750, height: 13)
                    graphic_context.fill(rect)
                }
                
                attributedTitle.draw(in: titleStringRect)
                label2.draw(at: CGPoint(x: 535, y: base), withAttributes: header_bold as [NSAttributedString.Key : Any])
                label3.draw(at: CGPoint(x: 535, y: base+12), withAttributes: header_bold as [NSAttributedString.Key : Any])
                customer.draw(in: CGRect(x: 589, y: base, width: 180, height: 20))
                address.draw(in: CGRect(x: 580, y: base+12, width: 190, height: 20))
                "IMAGE DESCRIPTION:".draw(at: CGPoint(x: 25, y: 40), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                let description = NSAttributedString(string: self.ImageDescription1.text ?? "", attributes: textAttributes)
                // 4
                description.draw(in: CGRect(x: 25, y: 55, width: 745, height: 40))
                let image_rect = CGRect(x: x_cord, y: y_cord,width: width_img*scale, height: height_img*scale)
                selectedImage1.draw(in: image_rect)
            }
            
            if self.selectedImage2.size.width != 0{
                context.beginPage()
                let width_img = Double(selectedImage2.size.width)
                let height_img = Double(selectedImage2.size.height)
                let width_ratio = 700 / width_img
                let heigth_ratio = 480 / height_img
                let scale = min(width_ratio,heigth_ratio)
                let x_cord = (pageWidth - width_img*scale)/2
                let y_cord = (pageHeight - height_img*scale)/2 + 50
                if let graphic_context = UIGraphicsGetCurrentContext(){
                    graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                    var rect = CGRect(x: 0, y: 0, width: 792, height: 612)
                    graphic_context.fill(rect)
                    graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                    rect = CGRect(x: 20, y: 40, width: 750, height: 13)
                    graphic_context.fill(rect)
                }
                attributedTitle.draw(in: titleStringRect)
                label2.draw(at: CGPoint(x: 535, y: base), withAttributes: header_bold as [NSAttributedString.Key : Any])
                label3.draw(at: CGPoint(x: 535, y: base+12), withAttributes: header_bold as [NSAttributedString.Key : Any])
                customer.draw(in: CGRect(x: 589, y: base, width: 180, height: 20))
                address.draw(in: CGRect(x: 580, y: base+12, width: 190, height: 20))
                "IMAGE DESCRIPTION:".draw(at: CGPoint(x: 25, y: 40), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                let description = NSAttributedString(string: self.ImageDescription2.text ?? "", attributes: textAttributes)
                // 4
                description.draw(in: CGRect(x: 25, y: 55, width: 745, height: 40))
                let image_rect = CGRect(x: x_cord, y: y_cord,width: width_img*scale, height: height_img*scale)
                selectedImage2.draw(in: image_rect)
            }
            
            if self.selectedImage3.size.width != 0{
                context.beginPage()
                let width_img = Double(selectedImage3.size.width)
                let height_img = Double(selectedImage3.size.height)
                let width_ratio = 700 / width_img
                let heigth_ratio = 480 / height_img
                let scale = min(width_ratio,heigth_ratio)
                let x_cord = (pageWidth - width_img*scale)/2
                let y_cord = (pageHeight - height_img*scale)/2 + 50
                if let graphic_context = UIGraphicsGetCurrentContext(){
                    graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                    var rect = CGRect(x: 0, y: 0, width: 792, height: 612)
                    graphic_context.fill(rect)
                    graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                    rect = CGRect(x: 20, y: 40, width: 750, height: 13)
                    graphic_context.fill(rect)
                }
                attributedTitle.draw(in: titleStringRect)
                label2.draw(at: CGPoint(x: 535, y: base), withAttributes: header_bold as [NSAttributedString.Key : Any])
                label3.draw(at: CGPoint(x: 535, y: base+12), withAttributes: header_bold as [NSAttributedString.Key : Any])
                customer.draw(in: CGRect(x: 589, y: base, width: 180, height: 20))
                address.draw(in: CGRect(x: 580, y: base+12, width: 190, height: 20))
                "IMAGE DESCRIPTION:".draw(at: CGPoint(x: 25, y: 40), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                let description = NSAttributedString(string: self.ImageDescription3.text ?? "", attributes: textAttributes)
                // 4
                description.draw(in: CGRect(x: 25, y: 55, width: 745, height: 40))
                let image_rect = CGRect(x: x_cord, y: y_cord,width: width_img*scale, height: height_img*scale)
                selectedImage3.draw(in: image_rect)
            }
            
        }
        return data
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result == MFMailComposeResult.sent {
            self.email_sent = 1
            _ = navigationController?.popViewController(animated: true)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SendEmailClick(_ sender: Any) {
        if confirmInformationSubmitted(){
            self.data = self.createFlyer()
            // performSegue(withIdentifier: "previewPDF", sender: self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: DatePicker.date)
            
            var to_recipients = self.CustomerEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ",")
            let manual_email = self.CustomerEmailtext.text!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ",")
            let additional_recipients = self.addEmailtext.text!.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ",")
            let job_type = JobTypebutton.titleLabel?.text
            let customer_name = SelectCustomerlabel.text!
            let manual_customer = SelectCustomertext.text!.uppercased()
            let char: Character = "@"
            var message = ""
            
            var count_array = [0]; var input_type = ""
            if job_type == "Manual Entry"{
                input_type = "Manual"
                for Item in manual_email {count_array.append((Item.filter { $0 == char }.count))}
            } else {
                input_type = "Additional"
                for Item in additional_recipients {count_array.append((Item.filter { $0 == char }.count))}
            }
            if count_array.max()! >= 2 {
                let alert = UIAlertController(title: "\(input_type) Email Type Error", message: "Please separate multiple email address with comma ',' ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            } else {
                to_recipients += additional_recipients
                if MFMailComposeViewController.canSendMail() {
                    let mail = MFMailComposeViewController()
                    mail.mailComposeDelegate = self
                    
                    if job_type == "Construction"{
                        message = "Dear PIERPONT MECH DISPATCH,<br><br>We performed a CONSTRUCTION work order for \(customer_name) on \(date_input). This is an automated receipt of work performed.<br><br>Thank you,"
                        mail.setToRecipients(["dispatch@pierpontmech.com"] + additional_recipients)
                        mail.setSubject("\(customer_name)_Work Order#\(self.workNumber)_\(date_input)")
                        mail.setMessageBody(message, isHTML: true)
                        mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "\(customer_name)_Work Order#\(self.workNumber)_\(date_input).pdf")
                        
                    } else if job_type == "Maintenance" {
                        message = "Dear \(self.Company_Name),<br><br>Pierpont Mechanical performed a scheduled maintenance on \(date_input). This is an automated receipt of work performed.<br><br>Thank you,"
                        mail.setToRecipients(to_recipients)
                        mail.setCcRecipients(["dispatch@pierpontmech.com"])
                        mail.setSubject("Pierpont Mechanical_Work Order#\(self.workNumber)_\(self.Company_Name)_\(date_input)")
                        mail.setMessageBody(message, isHTML: true)
                        mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "Pierpont Mechanical_Work Order#\(self.workNumber)_\(self.Company_Name)_\(date_input).pdf")
                        
                    } else if job_type == "Emergency Service" {
                        message = "Dear \(self.Company_Name),<br><br>Pierpont Mechanical performed an emergency service request on \(date_input). This is an automated receipt of work performed.<br><br>Thank you,"
                        mail.setToRecipients(to_recipients)
                        mail.setCcRecipients(["dispatch@pierpontmech.com"])
                        mail.setSubject("Pierpont Mechanical_Work Order#\(self.workNumber)_\(self.Company_Name)_\(date_input)")
                        mail.setMessageBody(message, isHTML: true)
                        mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "Pierpont Mechanical_Work Order#\(self.workNumber)_\(self.Company_Name)_\(date_input).pdf")
                        
                    } else if job_type == "Proposal" {
                        message = "Dear PIERPONT MECH DISPATCH,<br><br>We performed a PROPOSAL work order for \(customer_name) on \(date_input). This is an automated receipt of work performed.<br><br>Thank you,"
                        mail.setToRecipients(["dispatch@pierpontmech.com"] + additional_recipients)
                        mail.setSubject("\(customer_name)_Work Order#\(self.workNumber)_\(date_input)")
                        mail.setMessageBody(message, isHTML: true)
                        mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "\(customer_name)_Work Order#\(self.workNumber)_\(date_input).pdf")
                        
                    } else {
                        message = "Dear PIERPONT MECH DISPATCH,<br><br>We performed a work order for \(manual_customer) on \(date_input). This is an automated receipt of work performed.<br><br>Thank you,"
                        mail.setToRecipients(["dispatch@pierpontmech.com"] + manual_email)
                        mail.setSubject("\(manual_customer)_Work Order#\(self.workNumber)_\(date_input)")
                        mail.setMessageBody(message, isHTML: true)
                        mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "\(manual_customer)_Work Order#\(self.workNumber)_\(date_input).pdf")
                    }
            
                    present(mail, animated: true)
                }
                else {
                    let alert = UIAlertController(title: "Device Mail Application Error", message: "Please Sign in to Company Email Account.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    func confirmInformationSubmitted() -> Bool {
        var error_string = ""
        var error_count = 0
        
        if (SelectCustomerlabel.text == "SELECT CUSTOMER" || SelectCustomerlabel.text == "SELECT JOB TYPE") && JobTypebutton.titleLabel?.text != "Manual Entry"{
            error_count += 1
            error_string += "\n\(error_count). SELECT CUSTOMER"
        }
        if SelectMainMechaniclabel.text == "SELECT MECHANIC"{
            error_count += 1
            error_string += "\n\(error_count). SELECT MECHANIC"
        }
        if regHours1.text == "" && otHours1.text == "" && dtHours1.text == ""{
            error_count += 1
            error_string += "\n\(error_count). LABOR HOURS"
        }
        if JobTypebutton.titleLabel?.text == "Select Job Type" {
            error_count += 1
            error_string += "\n\(error_count). SELECT JOB TYPE"
        }
        if !TechnicianSignature.doesContainSignature {
            error_count += 1
            error_string += "\n\(error_count). TECHNICIAN SIGNATURE"
        }
        if CustomerName.text == "" && (JobTypebutton.titleLabel?.text == "Maintenance" || JobTypebutton.titleLabel?.text == "Emergency Service" || JobTypebutton.titleLabel?.text == "Select Job Type"){
            error_count += 1
            error_string += "\n\(error_count). CUSTOMER NAME"
        }
        if !CustomerSignature.doesContainSignature && (JobTypebutton.titleLabel?.text == "Maintenance" || JobTypebutton.titleLabel?.text == "Emergency Service" || JobTypebutton.titleLabel?.text == "Select Job Type"){
            error_count += 1
            error_string += "\n\(error_count). CUSTOMER SIGNATURE"
        }
        
        if error_string == "" {return true}
        let alert = UIAlertController(title: "Please Provide the Following:",
            message: "\(error_string)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "previewPDF" {
        guard let vc = segue.destination as? ViewControllerTemp else { return }
          vc.documentData = self.data
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 1}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {return Customer_Data.count}
        else {return Mechanic_Names.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        if pickerView.tag == 1 {label.text = Customer_Data[row].uppercased()}
        else {label.text = Mechanic_Names[row].uppercased()}
        label.font = UIFont(name:"Roboto-Bold",size: 18)
        label.sizeToFit()
        return label
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        // Save Image to Photo Library
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {return 40}
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
        let newLines = text.components(separatedBy: CharacterSet.newlines)
        let linesAfterChange = existingLines.count + newLines.count - 1

        return linesAfterChange <= textView.textContainer.maximumNumberOfLines
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let font_attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .medium)]
        guard let selectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
              return
        }
        let width_img = Double(selectImage.size.width)
        let height_img = Double(selectImage.size.height)
        let width_ratio = 700 / width_img
        let heigth_ratio = 480 / height_img
        let scale = min(width_ratio,heigth_ratio)
        let newSize = CGSize(width: width_img*scale, height: height_img*scale)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        selectImage.draw(in: CGRect(x: 0.0, y: 0.0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        if self.photoPicker.view.tag == 1 {
              self.selectedImage1 = newImage
              ImageButton1.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        else if self.photoPicker.view.tag == 2 {
              self.selectedImage2 = newImage
              ImageButton2.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        else if self.photoPicker.view.tag == 3 {
              self.selectedImage3 = newImage
              ImageButton3.setAttributedTitle(NSMutableAttributedString(string:"Image Saved", attributes: font_attributes), for: .normal)
        }
        if self.photoPicker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(selectImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        dismiss(animated: true, completion: nil)
    }
}
