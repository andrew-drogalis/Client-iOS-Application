//
//  ViewController.swift
//  Pierpont1
//
//  Created by Andrew Drogalis on 3/27/22.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var segue_data: [String] = [String]()
    var SavedForms_Dict: [String:[String]] = [String:[String]]()
    var Temp_Dict: [String:[String]] = [String:[String]]()
    var Temp_Images: [String:[UIImage]] = [String:[UIImage]]()
    var SavedForms_Images: [String:[UIImage]] = [String:[UIImage]]()
    var Temp_Signature: [String:[UIBezierPath]] = [String:[UIBezierPath]]()
    var SavedForms_Signature: [String:[UIBezierPath]] = [String:[UIBezierPath]]()
    var SavedForms_Names: [String] = [String]()
    var Temp_SavedForms_Dict: [String:[String]] = [String:[String]]()
    var Load_Data = 0
    @IBOutlet weak var Tabelview: UITableView!
    @IBOutlet weak var TabelViewHieghtConstraint: NSLayoutConstraint!
    @IBOutlet weak var ViewHeight: NSLayoutConstraint!
    @IBOutlet weak var InfoButton: UIButton!
    struct Mechanic_Data: Decodable {let name: String}
    struct Work_Order_Number: Decodable {let work_order_number: String}
    struct Construction_Info: Decodable {let display_name: String; let name: String; let address: String; let job_number: String}
    struct Maintenance_Info: Decodable {let display_name: String; let name: String; let address: String; let email_address: String; let job_number: String}
    var Construction_Dict: [String:[String]] = [String:[String]]()
    var Maintenance_Dict: [String:[String]] = [String:[String]]()
    var Mechanic_Names: [String] = [String]()
    var Temp_Construction_Dict: [String:[String]] = [String:[String]]()
    var Temp_Maintenance_Dict: [String:[String]] = [String:[String]]()
    var Temp_Mechanic_Names: [String] = [String]()
    var WorkOrder_Array: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "PrimaryTableViewCell", bundle: nil)
        Tabelview.register(nib, forCellReuseIdentifier: "PrimaryTableViewCell")
        Tabelview.delegate = self
        Tabelview.dataSource = self
        Tabelview.allowsSelection = true
        Tabelview.layer.borderWidth = 0.5
        Tabelview.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        let height_table = Float(SavedForms_Names.count) * 43.5
        TabelViewHieghtConstraint.constant = CGFloat(height_table)
        ViewHeight.constant = 600 + CGFloat(height_table)
        FileDatabaseRead()
        SavePostFiles(); ReadSavedFormFiles(); ReadWorkOrder()
        CheckAppVersion()
    }
    
    func SavePostFiles() {
        Maintenance_Post(); Construction_Post(); Mechanic_Post()
    }
    
    func CheckAppVersion(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let AV_Data_Path = documentDirectory[0].appendingPathComponent("App-Version.txt")
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        do {
            let file_text = try String(contentsOf: AV_Data_Path, encoding: .utf8)
            if file_text != appVersion {self.SaveAppVersion(path: AV_Data_Path, appVersion: appVersion)}
            }
        catch {self.SaveAppVersion(path: AV_Data_Path, appVersion: appVersion)}
    }

    func SaveAppVersion(path: URL, appVersion: String){
        do{
            try appVersion.write(to: path, atomically: false, encoding: .utf8)
            let alert = UIAlertController(title: "Installation Complete", message: "You have installed Pierpont Mechanical App - Version \(appVersion)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } catch {print("Error")}
    }
    
    func ReadWorkOrder(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let WorkOrder_Data_Path = documentDirectory[0].appendingPathComponent("WorkOrder-Data.txt")
        // Read Work Order File
        do {
            let data = try Data(contentsOf: WorkOrder_Data_Path)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            self.WorkOrder_Array = jsonResult as! [String]
        }
        catch {print("Error")}
        
        if WorkOrder_Array.count <= 5 {WorkOrder_Post()}
    }
    
    func WriteWorkOrder(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let WorkOrder_Data_Path = documentDirectory[0].appendingPathComponent("WorkOrder-Data.txt")
     
        let jsonData = try? JSONEncoder().encode(self.WorkOrder_Array)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        let outputStream = OutputStream(url: WorkOrder_Data_Path, append: false)
        outputStream?.open()
        outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
        outputStream?.close()
        if WorkOrder_Array.count <= 5 {WorkOrder_Post()}
    }
    
    func FileDatabaseRead(){        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let Maintenance_Data_Path = documentDirectory[0].appendingPathComponent("Maintenance-Data.txt")
        let Construction_Data_Path = documentDirectory[0].appendingPathComponent("Construction-Data.txt")
        let Mechanic_Data_Path = documentDirectory[0].appendingPathComponent("Mechanic-Data.txt")
        // Read Construction File
        do {
            let data = try Data(contentsOf: Construction_Data_Path)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            self.Construction_Dict = jsonResult as! [String:[String]]
        }
        catch {print("Error")}
        // Read Maintenance File
        do {
            let data = try Data(contentsOf: Maintenance_Data_Path)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            self.Maintenance_Dict = jsonResult as! [String:[String]]
        }
        catch {print("Error")}
        // Read Mechanic File
        do {
            let data = try Data(contentsOf: Mechanic_Data_Path)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            self.Mechanic_Names = jsonResult as! [String]
        }
        catch {print("Error")}
    }
    
    func WriteSaveFormsFiles() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let SavedForms_Data_Path = documentDirectory[0].appendingPathComponent("Saved-Forms-Data.txt")

        let jsonData = try? JSONEncoder().encode(self.SavedForms_Dict)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        let outputStream = OutputStream(url:  SavedForms_Data_Path, append: false)
        outputStream?.open()
        outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
        outputStream?.close()
    }
    
    func ReadSavedFormFiles(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let SavedForms_Data_Path = documentDirectory[0].appendingPathComponent("Saved-Forms-Data.txt")
        do {
            let data = try Data(contentsOf: SavedForms_Data_Path)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            self.Temp_SavedForms_Dict = jsonResult as! [String:[String]]
        } catch {
            print("Error")
        }
        if Temp_SavedForms_Dict.count != SavedForms_Dict.count {
            SavedForms_Dict = Temp_SavedForms_Dict
            SavedForms_Names = Array(SavedForms_Dict.keys)
            SavedForms_Names.sort()
            refreshTabel()
        }
    }
    
    @IBAction func InfoButtonClicked(_ sender: Any) {
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        var updateDate = Date(); var date_input = ""
        do{
            let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")
            let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath!)
            updateDate = infoAttr![.modificationDate] as! Date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            date_input = dateFormatter.string(from: updateDate)
        }
        
        let alert = UIAlertController(title: "Pierpont Mechanical App Info", message: "Version \(appVersion)\nReleased on \(date_input)\n\n Copyright Pierpont Mechanical Corp.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK",style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func TimeSheetSend(_ sender: Any) {
        Load_Data = 0
        performSegue(withIdentifier: "TimeSheetSegue", sender: self)
    }
    
    @IBAction func StartUpSend(_ sender: Any) {
        Load_Data = 0
        performSegue(withIdentifier: "StartUpSegue", sender: self)
    }
    
    @IBAction func WorkOrderSend(_ sender: Any) {
        Load_Data = 0
        performSegue(withIdentifier: "WorkOrderSegue", sender: self)
    }
    
    func deleteSavedForm(name: String){
        self.SavedForms_Dict.removeValue(forKey: name)
        SavedForms_Names = Array(SavedForms_Dict.keys)
        SavedForms_Names.sort()
        let _ = try? self.SavedForms_Images.removeValue(forKey: name)
        let _ = try? self.SavedForms_Signature.removeValue(forKey: name)
    }
    
    func refreshTabel(){
        Tabelview.reloadData()
        let height_table = Float(SavedForms_Names.count) * 43.5
        TabelViewHieghtConstraint.constant = CGFloat(height_table)
        ViewHeight.constant = 600 + CGFloat(height_table)
        if SavedForms_Names.count >= 29 {
            let alert = UIAlertController(title: "Maximum Allowed Saved Forms", message: "Please delete or email forms", preferredStyle: .alert)
            // Add Actions
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    func mergeDictionarys(){
        SavedForms_Dict = SavedForms_Dict.merging(Temp_Dict) {(_,new) in new}
        SavedForms_Names = Array(SavedForms_Dict.keys)
        SavedForms_Names.sort()
        SavedForms_Images = SavedForms_Images.merging(Temp_Images) {(_,new) in new}
        SavedForms_Signature = SavedForms_Signature.merging(Temp_Signature) {(_,new) in new}
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedForms_Names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tabelview.dequeueReusableCell(withIdentifier: "PrimaryTableViewCell", for: indexPath) as! PrimaryTableViewCell
        cell.Label.text = SavedForms_Names[indexPath.row].uppercased()
        cell.Label.font = UIFont(name: "Roboto-Bold", size: 20.0)
        let backgroundView = UIView(); let selectedView = UIView()
        backgroundView.backgroundColor = UIColor.white
        cell.backgroundView = backgroundView
        selectedView.backgroundColor = UIColor.lightGray
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = self.SavedForms_Names[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let data_array = self.SavedForms_Dict[name]
        Load_Data = 1
        if "\(data_array![0])" == "WORKORDER" {
            self.segue_data = data_array ?? [""]
            performSegue(withIdentifier: "WorkOrderSegue", sender: self)
        } else if "\(data_array![0])" == "STARTUP" {
            self.segue_data = data_array ?? [""]
            performSegue(withIdentifier: "StartUpSegue", sender: self)
        } else if "\(data_array![0])" == "TIMESHEET" {
            self.segue_data = data_array ?? [""]
            performSegue(withIdentifier: "TimeSheetSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if WorkOrder_Array.count == 0 {ReadWorkOrder()}
        if segue.identifier == "WorkOrderSegue" {
            guard let vc = segue.destination as? WorkOrderViewController else { return }
            vc.Construction_Dict = Construction_Dict
            vc.Maintenance_Dict = Maintenance_Dict
            vc.Mechanic_Names = Mechanic_Names
            vc.SavedForms_Dict = SavedForms_Dict
            if Load_Data == 1 {
                vc.Start_Name = segue_data[1]
                vc.date_set = segue_data[2]
                vc.job_type_set = segue_data[3]
                vc.customer_label_set = segue_data[4]
                vc.Company_Name = segue_data[5]
                vc.address_label_set = segue_data[6]
                vc.customer_email_label_set = segue_data[7]
                vc.job_number_set = segue_data[8]
                vc.mechanic_main_set = segue_data[9]
                vc.workNumber = segue_data[10]
                vc.additional_email_set = segue_data[11]
                vc.customer_manual_set = segue_data[12]
                vc.address_manual_set = segue_data[13]
                vc.email_manual_set = segue_data[14]
                vc.make_set = segue_data[15]
                vc.model_set = segue_data[16]
                vc.serial_set = segue_data[17]
                vc.description_performed_set = segue_data[18]
                vc.materials_set = segue_data[19]
                vc.recommendations_set = segue_data[20]
                vc.image_description1_set = segue_data[21]
                vc.image_description2_set = segue_data[22]
                vc.image_description3_set = segue_data[23]
                vc.image_button1_set = segue_data[24]
                vc.image_button2_set = segue_data[25]
                vc.image_button3_set = segue_data[26]
                vc.customer_name_set = segue_data[27]
                vc.teammember2_set = segue_data[28]
                vc.teammember3_set = segue_data[29]
                vc.teammember4_set = segue_data[30]
                vc.addrow2_button_set = segue_data[31]
                vc.addrow3_button_set = segue_data[32]
                vc.addrow4_button_set = segue_data[33]
                vc.selectedRowCustomer = Int(segue_data[34]) ?? 0
                vc.selectedMainMechanic = Int(segue_data[35]) ?? 0
                vc.selectedTeamMember2 = Int(segue_data[36]) ?? 0
                vc.selectedTeamMember3 = Int(segue_data[37]) ?? 0
                vc.selectedTeamMember4 = Int(segue_data[38]) ?? 0
                var temp_labor_hours: [String] = [String]()
                for i in 0...11{
                    temp_labor_hours.append(segue_data[i+39])
                }
                vc.labor_hours_array_set = temp_labor_hours
                let Images_Files = try? self.SavedForms_Images[self.segue_data[1]]
                vc.selectedImage1 = Images_Files?[0] ?? UIImage()
                vc.selectedImage2 = Images_Files?[1] ?? UIImage()
                vc.selectedImage3 = Images_Files?[2] ?? UIImage()
                
                let Signature_Files = try? self.SavedForms_Signature[self.segue_data[1]]
                vc.Technician_sign_set = Signature_Files?[0] ?? UIBezierPath()
                vc.Customer_sign_set = Signature_Files?[1] ?? UIBezierPath()
                
            } else {
                if self.WorkOrder_Array.count > 0 {
                    vc.workNumber = self.WorkOrder_Array[0]
                    self.WorkOrder_Array.remove(at: 0); WriteWorkOrder()
                }
            }
        }
        if segue.identifier == "StartUpSegue" {
        guard let vc = segue.destination as? StartupViewController else { return }
            vc.Construction_Dict = Construction_Dict
            vc.Maintenance_Dict = Maintenance_Dict
            vc.Mechanic_Names = Mechanic_Names
            vc.SavedForms_Dict = SavedForms_Dict
            if Load_Data == 1 {
                vc.Start_Name = segue_data[1]
                vc.date_set = segue_data[2]
                vc.job_name_set = segue_data[3]
                vc.address_set = segue_data[4]
                vc.job_number_set = segue_data[5]
                vc.mechanic_set = segue_data[6]
                vc.floor_set = segue_data[7]
                vc.equipment_button_set = segue_data[8]
                vc.equipment_text_set = segue_data[9]
                vc.unit_number_set = segue_data[10]
                vc.unit_make_set = segue_data[11]
                vc.unit_model_set = segue_data[12]
                vc.unit_serial_set = segue_data[13]
                vc.filters_set = segue_data[14]
                vc.fan_hp_set = segue_data[15]
                vc.fan_belt_set = segue_data[16]
                vc.fan_frame_set = segue_data[17]
                vc.fan_voltage_set = segue_data[18]
                vc.fan_amprating_set = segue_data[19]
                vc.fan_ampactual_set = segue_data[20]
                vc.fan_coolingSA_set = segue_data[21]
                vc.fan_coolingRA_set = segue_data[22]
                vc.fan_coolingDelta_set = segue_data[23]
                vc.fan_heatingSA_set = segue_data[24]
                vc.fan_heatingRA_set = segue_data[25]
                vc.fan_heatingDelta_set = segue_data[26]
                vc.acc_make_set = segue_data[27]
                vc.acc_model_set = segue_data[28]
                vc.acc_serial_set = segue_data[29]
                vc.acc_voltage_set = segue_data[30]
                vc.acc_hp_set = segue_data[31]
                vc.acc_belt_set = segue_data[32]
                vc.acc_frame_set = segue_data[33]
                vc.acc_amprating_set = segue_data[34]
                vc.acc_ampactual_set = segue_data[35]
                vc.acc_incoming_set = segue_data[36]
                vc.acc_discharge_set = segue_data[37]
                vc.acc_delta_set = segue_data[38]
                vc.wcc_make_set = segue_data[39]
                vc.wcc_model_set = segue_data[40]
                vc.wcc_serial_set = segue_data[41]
                vc.comp1_make_set = segue_data[42]
                vc.comp1_model_set = segue_data[43]
                vc.comp1_serial_set = segue_data[44]
                vc.comp1_voltage_set = segue_data[45]
                vc.comp1_refrigerant_set = segue_data[46]
                vc.comp1_chargelbs_set = segue_data[47]
                vc.comp1_chargeoz_set = segue_data[48]
                vc.comp1_highside_set = segue_data[49]
                vc.comp1_lowside_set = segue_data[50]
                vc.comp1_amprating_set = segue_data[51]
                vc.comp1_ampactual_set = segue_data[52]
                vc.comp1_enteringpres_set = segue_data[53]
                vc.comp1_leavingpres_set = segue_data[54]
                vc.comp1_enteringtemp_set = segue_data[55]
                vc.comp1_leavingtemp_set = segue_data[56]
                vc.comp2_make_set = segue_data[57]
                vc.comp2_model_set = segue_data[58]
                vc.comp2_serial_set = segue_data[59]
                vc.comp2_voltage_set = segue_data[60]
                vc.comp2_refrigerant_set = segue_data[61]
                vc.comp2_chargelbs_set = segue_data[62]
                vc.comp2_chargeoz_set = segue_data[63]
                vc.comp2_highside_set = segue_data[64]
                vc.comp2_lowside_set = segue_data[65]
                vc.comp2_amprating_set = segue_data[66]
                vc.comp2_ampactual_set = segue_data[67]
                vc.pump_make_set = segue_data[68]
                vc.pump_model_set = segue_data[69]
                vc.pump_voltage_set = segue_data[70]
                vc.pump_system_set = segue_data[71]
                vc.pump_amprating_set = segue_data[72]
                vc.pump_ampactual_set = segue_data[73]
                vc.pump_enteringpres_set = segue_data[74]
                vc.pump_leavingpres_set = segue_data[75]
                vc.pump_enteringtemp_set = segue_data[76]
                vc.pump_leavingtemp_set = segue_data[77]
                vc.vol_make_set = segue_data[78]
                vc.vol_model_set = segue_data[79]
                vc.vol_serial_set = segue_data[80]
                vc.vol_impeller_set = segue_data[81]
                vc.water_reg_set = segue_data[82]
                vc.leak_detection_set = segue_data[83]
                vc.unit_pitched_set = segue_data[84]
                vc.drainline_set = segue_data[85]
                vc.condensate_pump_set = segue_data[86]
                vc.BMS_set = segue_data[87]
                vc.bms_vendor_set = segue_data[88]
                vc.strainers_set = segue_data[89]
                vc.pipe_labeling_set = segue_data[90]
                vc.humidifier_set = segue_data[91]
                vc.humid_serial_set = segue_data[92]
                vc.humid_model_set = segue_data[93]
                vc.humid_amps_set = segue_data[94]
                vc.ladder_set = segue_data[95]
                vc.notes_set = segue_data[96]
                vc.selectedRowJobName = Int(segue_data[97]) ?? 0
                vc.selectedMainMechanic = Int(segue_data[98]) ?? 0
                vc.pump_unitnumber_set = segue_data[99]
                if segue_data.count > 100{
                    vc.thermostat_set = segue_data[100]
                    vc.autovalve_set = segue_data[101]}
                else{
                    vc.thermostat_set = "Select Option"
                    vc.autovalve_set = "Select Option"}
                if segue_data.count > 102{
                    vc.fan_voltageactual_set = segue_data[102]
                    vc.acc_voltageactual_set = segue_data[103]
                    vc.pump_voltageactual_set = segue_data[104]
                }
                if segue_data.count > 105{
                    vc.job_type_set = segue_data[105]}
                else{
                    vc.job_type_set = "Construction"
                }
            }
        }
        if segue.identifier == "TimeSheetSegue" {
            guard let vc = segue.destination as? TimeSheetViewController else { return }
            vc.Construction_Dict = Construction_Dict
            vc.Maintenance_Dict = Maintenance_Dict
            vc.Mechanic_Names = Mechanic_Names
            if Load_Data == 1 {
                vc.Start_Name = segue_data[1]
                vc.mechanic_name_set = segue_data[2]
                vc.date_set = segue_data[3]
                vc.night_service_set = segue_data[4]
                vc.project_number_set = segue_data[5]
                vc.notes_set = segue_data[6]
                vc.selectedMainMechanic = Int(segue_data[7]) ?? 0
                var temp_selected_rows: [Int] = [Int]()
                var temp_job_types: [String] = [String]()
                var temp_project_values: [String] = [String]()
                var temp_manual_values: [String] = [String]()
                for i in 0...14{
                    temp_selected_rows.append(Int(segue_data[i+8]) ?? 0)
                    temp_job_types.append(segue_data[i+23])
                    temp_project_values.append(segue_data[i+38])
                    temp_manual_values.append(segue_data[i+53])
                }
                vc.selected_row_values = temp_selected_rows
                vc.job_type_values = temp_job_types
                vc.project_values = temp_project_values
                vc.manual_values = temp_manual_values
                var temp_Reg: [String] = [String]()
                var temp_OT: [String] = [String]()
                var temp_DT: [String] = [String]()
                for i in 0...74{temp_Reg.append(segue_data[i+68])}
                for i in 0...89{temp_OT.append(segue_data[i+143])}
                for i in 0...14{temp_DT.append(segue_data[i+233])}
                vc.Reg_Hours_ = temp_Reg
                vc.OT_Hours_ = temp_OT
                vc.DT_Hours_ = temp_DT
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "✕\nDelete") { (contextualAction,view,actionPerformed: @escaping (Bool) -> ()) in
            let name = self.SavedForms_Names[indexPath.row]
            let alert = UIAlertController(title: "Confirmation", message: "Delete '\(name.uppercased())' from Saved Forms?", preferredStyle: .alert)
            // Add Actions
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction) in actionPerformed(false)}))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {(UIAlertAction) in
                self.SavedForms_Names.remove(at: indexPath.row)
                self.SavedForms_Dict.removeValue(forKey: name)
                let _ = try? self.SavedForms_Images.removeValue(forKey: name)
                let _ = try? self.SavedForms_Signature.removeValue(forKey: name)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.WriteSaveFormsFiles()
                let height_table = Float(self.SavedForms_Names.count) * 43.5
                self.TabelViewHieghtConstraint.constant = CGFloat(height_table)
                self.ViewHeight.constant = 600 + CGFloat(height_table)
                actionPerformed(true)
            }))
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func WorkOrder_Post() {
        guard let myURL = URL(string:"https://hlm.xwg.mybluehost.me/workorder.php") else { return }
        let request = NSMutableURLRequest(url: myURL)
        request.httpMethod = "POST"
        let postString = "password=HIDDEN_FOR_PRIVACY"
        request.httpBody = postString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
                { data, response, error in
                    if error != nil {print(error)
                        self.ReadWorkOrder(); return}
                    do {
                        let Json_Decoded: [Work_Order_Number] = try JSONDecoder().decode([Work_Order_Number].self, from: data!)
                        for Item in Json_Decoded{
                            self.WorkOrder_Array.append(Item.work_order_number)
                        }
                        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                        let WorkOrder_Data_Path = documentDirectory[0].appendingPathComponent("WorkOrder-Data.txt")
                     
                        let jsonData = try? JSONEncoder().encode(self.WorkOrder_Array)
                        let jsonString = String(data: jsonData!, encoding: .utf8)
                        let outputStream = OutputStream(url: WorkOrder_Data_Path, append: false)
                        outputStream?.open()
                        outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
                        outputStream?.close()
                    }
                    catch {
                        print("Error")
                    }
            }
        task.resume()
    }
    
    func Mechanic_Post() {
        guard let myURL = URL(string:"https://hlm.xwg.mybluehost.me/mechanic.php") else { return }
        let request = NSMutableURLRequest(url: myURL)
        request.httpMethod = "POST"
        let postString = "password=HIDDEN_FOR_PRIVACY"
        request.httpBody = postString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        Temp_Mechanic_Names = [String]()
        let task = URLSession.shared.dataTask(with: request as URLRequest)
                { data, response, error in
                    if error != nil {print(error); self.FileDatabaseRead(); return}
                    do {
                        let Json_Decoded: [Mechanic_Data] = try JSONDecoder().decode([Mechanic_Data].self, from: data!)
                        for Item in Json_Decoded{
                            self.Temp_Mechanic_Names.append(Item.name)
                        }
                        if self.Temp_Mechanic_Names.count != 0{
                            self.Mechanic_Names = self.Temp_Mechanic_Names
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                            let Mechanic_Data_Path = documentDirectory[0].appendingPathComponent("Mechanic-Data.txt")
                            let jsonData = try? JSONEncoder().encode(self.Temp_Mechanic_Names)
                            let jsonString = String(data: jsonData!, encoding: .utf8)
                            
                            let outputStream = OutputStream(url: Mechanic_Data_Path, append: false)
                            outputStream?.open()
                            outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
                            outputStream?.close()
                        }
                    }
                    catch {print(error)}
            }
        task.resume()
    }
    
    func Construction_Post() {
        guard let myURL = URL(string:"https://hlm.xwg.mybluehost.me/construction.php") else { return }
        let request = NSMutableURLRequest(url: myURL)
        request.httpMethod = "POST"
        let postString = "password=HIDDEN_FOR_PRIVACY"
        request.httpBody = postString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        Temp_Construction_Dict = [String:[String]]()
        let task = URLSession.shared.dataTask(with: request as URLRequest)
                { data, response, error in
                    if error != nil {print(error); self.FileDatabaseRead(); return}
                    do {
                        let Json_Decoded: [Construction_Info] = try JSONDecoder().decode([Construction_Info].self, from: data!)
                        for Item in Json_Decoded{
                            self.Temp_Construction_Dict[Item.display_name] = [Item.name,Item.address,"dispatch@pierpontmech.com",Item.job_number]
                        }
                        if self.Temp_Construction_Dict.count != 0 {
                            self.Construction_Dict = self.Temp_Construction_Dict
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                            let Construction_Data_Path = documentDirectory[0].appendingPathComponent("Construction-Data.txt")
                         
                            let jsonData = try? JSONEncoder().encode(self.Temp_Construction_Dict)
                            let jsonString = String(data: jsonData!, encoding: .utf8)
                            
                            let outputStream = OutputStream(url: Construction_Data_Path, append: false)
                            outputStream?.open()
                            outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
                            outputStream?.close()
                        }
                    }
                    catch {print(error)}
            }
        task.resume()
    }
    
    func Maintenance_Post() {
        guard let myURL = URL(string:"https://hlm.xwg.mybluehost.me/maintenance.php") else { return }
        let request = NSMutableURLRequest(url: myURL)
        request.httpMethod = "POST"
        let postString = "password=HIDDEN_FOR_PRIVACY"
        request.httpBody = postString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        Temp_Maintenance_Dict = [String:[String]]()
        let task = URLSession.shared.dataTask(with: request as URLRequest)
                { data, response, error in
                    if error != nil {print(error); self.FileDatabaseRead(); return}
                    do {
                        let Json_Decoded: [Maintenance_Info] = try JSONDecoder().decode([Maintenance_Info].self, from: data!)
                        for Item in Json_Decoded{
                            self.Temp_Maintenance_Dict[Item.display_name] = [Item.name,Item.address,Item.email_address,Item.job_number]
                        }
                        if self.Temp_Maintenance_Dict.count != 0 {
                            self.Maintenance_Dict = self.Temp_Maintenance_Dict
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                            let Maintenance_Data_Path = documentDirectory[0].appendingPathComponent("Maintenance-Data.txt")
                         
                            let jsonData = try? JSONEncoder().encode(self.Temp_Maintenance_Dict)
                            let jsonString = String(data: jsonData!, encoding: .utf8)
                            
                            let outputStream = OutputStream(url: Maintenance_Data_Path, append: false)
                            outputStream?.open()
                            outputStream?.write(jsonString!, maxLength: jsonString!.utf8.count)
                            outputStream?.close()
                        }
                    }
                    catch {print(error)}
            }
        task.resume()
    }

}

