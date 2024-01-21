//
//  StartupViewController.swift
//  Pierpont1
//
//  Created by Andrew Drogalis on 3/27/22.
//

import UIKit
import PDFKit
import MessageUI

class StartupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UITextViewDelegate {

    let title_page: String = "START UP SHEET"
    let logo_image = UIImage(named: "pierpontlogowhiteback")
    @IBOutlet weak var FiltersText: UITextView!
    @IBOutlet weak var NotesText: UITextView!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var NotesView: UIView!
    @IBOutlet weak var NotesTopConstraint: NSLayoutConstraint!
    var viewHeight: CGFloat = 0.0
    var email_sent = 0
    var Mechanic_Names: [String] = [String]()
    var Construction_DisplayName: [String] = [String]()
    var Construction_Dict: [String:[String]] = [String:[String]]()
    var Maintenance_DisplayName: [String] = [String]()
    var Maintenance_Dict: [String:[String]] = [String:[String]]()
    var SavedForms_Dict: [String:[String]] = [String:[String]]()
    var Customer_Dict: [String:[String]] = [String:[String]]()
    var Customer_Data: [String] = [String]()
    var data = Data()
    var pickerViewJobName = UIPickerView()
    var pickerViewMechanic = UIPickerView()
    var selectedRowJobName = 0
    var selectedMainMechanic = 0
    var previous_orientation = ""
    var current_orientation = ""
    var Temp_Dict: [String:[String]] = [String:[String]]()
    var Start_Name = ""
    var job_type_set = ""
    var date_set = ""
    var job_name_set = ""
    var address_set = ""
    var job_number_set = ""
    var mechanic_set = ""
    var floor_set = ""
    var equipment_button_set = ""
    var equipment_text_set = ""
    var unit_number_set = ""
    var unit_make_set = ""
    var unit_model_set = ""
    var unit_serial_set = ""
    var filters_set = ""
    var fan_hp_set = ""
    var fan_belt_set = ""
    var fan_frame_set = ""
    var fan_voltage_set = ""
    var fan_amprating_set = ""
    var fan_ampactual_set = ""
    var fan_coolingSA_set = ""
    var fan_coolingRA_set = ""
    var fan_coolingDelta_set = ""
    var fan_heatingSA_set = ""
    var fan_heatingRA_set = ""
    var fan_heatingDelta_set = ""
    var fan_voltageactual_set = ""
    var acc_make_set = ""
    var acc_model_set = ""
    var acc_serial_set = ""
    var acc_voltage_set = ""
    var acc_hp_set = ""
    var acc_belt_set = ""
    var acc_frame_set = ""
    var acc_amprating_set = ""
    var acc_ampactual_set = ""
    var acc_incoming_set = ""
    var acc_discharge_set = ""
    var acc_voltageactual_set = ""
    var acc_delta_set = ""
    var wcc_make_set = ""
    var wcc_model_set = ""
    var wcc_serial_set = ""
    var comp1_make_set = ""
    var comp1_model_set = ""
    var comp1_serial_set = ""
    var comp1_voltage_set = ""
    var comp1_refrigerant_set = ""
    var comp1_chargelbs_set = ""
    var comp1_chargeoz_set = ""
    var comp1_highside_set = ""
    var comp1_lowside_set = ""
    var comp1_amprating_set = ""
    var comp1_ampactual_set = ""
    var comp1_enteringpres_set = ""
    var comp1_leavingpres_set = ""
    var comp1_enteringtemp_set = ""
    var comp1_leavingtemp_set = ""
    var comp2_make_set = ""
    var comp2_model_set = ""
    var comp2_serial_set = ""
    var comp2_voltage_set = ""
    var comp2_refrigerant_set = ""
    var comp2_chargelbs_set = ""
    var comp2_chargeoz_set = ""
    var comp2_highside_set = ""
    var comp2_lowside_set = ""
    var comp2_amprating_set = ""
    var comp2_ampactual_set = ""
    var pump_make_set = ""
    var pump_model_set = ""
    var pump_system_set = ""
    var pump_voltage_set = ""
    var pump_amprating_set = ""
    var pump_ampactual_set = ""
    var pump_enteringpres_set = ""
    var pump_leavingpres_set = ""
    var pump_enteringtemp_set = ""
    var pump_leavingtemp_set = ""
    var pump_voltageactual_set = ""
    var vol_make_set = ""
    var vol_model_set = ""
    var vol_serial_set = ""
    var vol_impeller_set = ""
    var water_reg_set = ""
    var leak_detection_set = ""
    var unit_pitched_set = ""
    var drainline_set = ""
    var condensate_pump_set = ""
    var BMS_set = ""
    var bms_vendor_set = ""
    var strainers_set = ""
    var thermostat_set = ""
    var autovalve_set = ""
    var pipe_labeling_set = ""
    var humidifier_set = ""
    var humid_serial_set = ""
    var humid_model_set = ""
    var humid_amps_set = ""
    var ladder_set = ""
    var notes_set = ""
    var pump_unitnumber_set = ""
    
    @IBOutlet weak var SelectEquipmentbutton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var JobTypebutton: UIButton!
    @IBOutlet weak var SelectJobName: UIButton!
  
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var floortext: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var PMCjobnumber: UILabel!
    @IBOutlet weak var SelectMainMechanic: UIButton!
    @IBOutlet weak var SelectMainMechaniclabel: UILabel!
    @IBOutlet weak var SelectJobNamelabel: UILabel!
    @IBOutlet weak var SelectJobNameWidthConstaint: NSLayoutConstraint!
    @IBOutlet weak var AddressWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var EquipmentText: UITextField!
    // Unit Info
    @IBOutlet weak var EvapView: UIView!
    @IBOutlet weak var UnitInfolabel: UILabel!
    @IBOutlet weak var unitnumbertext: UITextField!
    @IBOutlet weak var unitmaketext: UITextField!
    @IBOutlet weak var unitmodeltext: UITextField!
    @IBOutlet weak var unitserialtext: UITextField!
    // Fan Info
    @IBOutlet weak var FanView: UIView!
    @IBOutlet weak var fanInfolabel: UILabel!
    @IBOutlet weak var fanHPtext: UITextField!
    @IBOutlet weak var fanHpWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fanBelttext: UITextField!
    @IBOutlet weak var fanBeltWidthConstarint: NSLayoutConstraint!
    @IBOutlet weak var fanFrametext: UITextField!
    @IBOutlet weak var fanAmpRatingtext: UITextField!
    @IBOutlet weak var fanAmpActualtext: UITextField!
    @IBOutlet weak var fanCoolingSA: UITextField!
    @IBOutlet weak var fanCoolingRA: UITextField!
    @IBOutlet weak var fanHeatingSA: UITextField!
    @IBOutlet weak var fanHeatingRA: UITextField!
    @IBOutlet weak var fanDeltaCooling: UILabel!
    @IBOutlet weak var fanDeltaHeating: UILabel!
    @IBOutlet weak var fanVoltage: UIButton!
    @IBOutlet weak var fanvoltageActual: UITextField!
    // Compressor #1
    @IBOutlet weak var Compressor1View: UIView!
    @IBOutlet weak var CompressorTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var Compressor1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var makeCompressor1text: UITextField!
    @IBOutlet weak var modelCompressor1text: UITextField!
    @IBOutlet weak var serialCompressor1text: UITextField!
    @IBOutlet weak var refrigerantCompressor1text: UITextField!
    @IBOutlet weak var chargeLbsCompressor1: UITextField!
    @IBOutlet weak var chargeOzCompressor1: UITextField!
    @IBOutlet weak var highsideCompressor1: UITextField!
    @IBOutlet weak var lowsideCompressor1: UITextField!
    @IBOutlet weak var AmpRatingCompressor1: UITextField!
    @IBOutlet weak var AmpActualCompressor1: UITextField!
    @IBOutlet weak var voltageCompressor1: UIButton!
    @IBOutlet weak var enteringPressurelabel: UILabel!
    @IBOutlet weak var enteringPressureCompressor1: UITextField!
    @IBOutlet weak var leavingPressurelabel: UILabel!
    @IBOutlet weak var leavingPressureCompressor1: UITextField!
    @IBOutlet weak var enteringTemperaturelabel: UILabel!
    @IBOutlet weak var enteringTemperatureCompressor1: UITextField!
    @IBOutlet weak var leavingTemperaturelabel: UILabel!
    @IBOutlet weak var leavingTemperatureCompressor1: UITextField!
    // Compressor #2
    @IBOutlet weak var Compressor2View: UIView!
    @IBOutlet weak var makeCompressor2: UITextField!
    @IBOutlet weak var modelCompressor2: UITextField!
    @IBOutlet weak var serialCompressor2: UITextField!
    @IBOutlet weak var refrigerantCompressor2: UITextField!
    @IBOutlet weak var chargeLbsCompressor2: UITextField!
    @IBOutlet weak var chargeOzCompressor2: UITextField!
    @IBOutlet weak var highsideCompressor2: UITextField!
    @IBOutlet weak var lowsideCompressor2: UITextField!
    @IBOutlet weak var AmpRatingCompressor2: UITextField!
    @IBOutlet weak var AmpActualCompressor2: UITextField!
    @IBOutlet weak var voltageCompressor2: UIButton!
    // Circulating Pump
    @IBOutlet weak var PumpView: UIView!
    @IBOutlet weak var PumpTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var makePump: UITextField!
    @IBOutlet weak var unitnumberPump: UITextField!
    @IBOutlet weak var modelPump: UITextField!
    @IBOutlet weak var voltagePump: UIButton!
    @IBOutlet weak var systemPump: UIButton!
    @IBOutlet weak var ampRatingPump: UITextField!
    @IBOutlet weak var ampActualPump: UITextField!
    @IBOutlet weak var enteringPressurePump: UITextField!
    @IBOutlet weak var leavingPressurePump: UITextField!
    @IBOutlet weak var enteringTemperaturePump: UITextField!
    @IBOutlet weak var leavingTemperaturePump: UITextField!
    @IBOutlet weak var voltageActualPump: UITextField!
    // Pump Volute
    @IBOutlet weak var VoluteView: UIView!
    @IBOutlet weak var makeVolute: UITextField!
    @IBOutlet weak var modelVolute: UITextField!
    @IBOutlet weak var serialVolute: UITextField!
    @IBOutlet weak var impellerVolute: UITextField!
    // Air Cooled Condenser
    @IBOutlet weak var ACCView: UIView!
    @IBOutlet weak var hpACC: UITextField!
    @IBOutlet weak var hpACCWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var ACCInfolabel: UILabel!
    @IBOutlet weak var beltACC: UITextField!
    @IBOutlet weak var betlACCWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var frameACC: UITextField!
    @IBOutlet weak var voltageACC: UIButton!
    @IBOutlet weak var ampRatingACC: UITextField!
    @IBOutlet weak var ampActualACC: UITextField!
    @IBOutlet weak var makeACC: UITextField!
    @IBOutlet weak var modelACC: UITextField!
    @IBOutlet weak var serialACC: UITextField!
    @IBOutlet weak var incomingTemp: UITextField!
    @IBOutlet weak var dischargeTemp: UITextField!
    @IBOutlet weak var deltaACC: UILabel!
    @IBOutlet weak var ACCvoltageActual: UITextField!
    @IBOutlet weak var ACCvoltageActualLabel: UILabel!
    // Water Cooled Condenser
    @IBOutlet weak var WCCView: UIView!
    @IBOutlet weak var WWCTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var makeWCC: UITextField!
    @IBOutlet weak var modelWCC: UITextField!
    @IBOutlet weak var serialWCC: UITextField!
    // Checklist
    @IBOutlet weak var ChecklistView: UIView!
    @IBOutlet weak var ChecklistTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var waterRegValve: UIButton!
    @IBOutlet weak var waterRegValvelabel: UILabel!
    @IBOutlet weak var leakDetectionTest: UIButton!
    @IBOutlet weak var leakDetectionlabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var leakDetectionbuttonConstraint: NSLayoutConstraint!
    @IBOutlet weak var unitPitchedTowardslabel: UILabel!
    @IBOutlet weak var unitPitchedTowards: UIButton!
    @IBOutlet weak var drainLinelabel: UILabel!
    @IBOutlet weak var drainLine: UIButton!
    @IBOutlet weak var condensatePumpTest: UIButton!
    @IBOutlet weak var condensatePumptestlabel: UILabel!
    @IBOutlet weak var isBMS: UIButton!
    @IBOutlet weak var BMSViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var strainersCracked: UIButton!
    @IBOutlet weak var strainersCrackedlabel: UILabel!
    @IBOutlet weak var pipeLabeling: UIButton!
    @IBOutlet weak var pipelabelingTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var pipelabelingbuttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var humidifierlabel: UILabel!
    @IBOutlet weak var humidifierbutton: UIButton!
    @IBOutlet weak var ladderbutton: UIButton!
    @IBOutlet weak var thermostatgaugelabel: UILabel!
    @IBOutlet weak var thermostatgauge: UIButton!
    @IBOutlet weak var autoisolationvalvelabel: UILabel!
    @IBOutlet weak var autoisolationvalve: UIButton!
    @IBOutlet weak var ladderlabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var ladderbuttonTopConstraint: NSLayoutConstraint!
    // BMS
    @IBOutlet weak var BMSvendorLabel: UILabel!
    @IBOutlet weak var BMSvendortext: UITextField!
    // Humidifer
    @IBOutlet weak var serialHumidiferlabel: UILabel!
    @IBOutlet weak var modelHumidiferlabel: UILabel!
    @IBOutlet weak var modelHumidifier: UITextField!
    @IBOutlet weak var serialHumidifer: UITextField!
    @IBOutlet weak var ampsHumidifer: UITextField!
    @IBOutlet weak var ampsHumidiferlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        FiltersText.layer.borderWidth = 0.5
        FiltersText.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        FiltersText.layer.cornerRadius = 6
        NotesText.layer.borderWidth = 0.5
        NotesText.layer.borderColor = UIColor(red:204/255, green:204/255, blue:204/255, alpha: 1).cgColor
        NotesText.layer.cornerRadius = 6
        NotesText.delegate = self; FiltersText.delegate = self
        FiltersText.textContainer.maximumNumberOfLines = 5
        NotesText.textContainer.maximumNumberOfLines = 11
        FiltersText.textContainer.lineBreakMode = .byTruncatingTail
        NotesText.textContainer.lineBreakMode = .byTruncatingTail
    
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: scrollView, action: #selector(UIView.endEditing(_:))))
        keyboardNotifications(); setUpButtonMenu(); rotateNotifications(); setupLabelTap()
        viewHeightConstraint.constant = 680
        self.viewHeight = viewHeightConstraint.constant
        pickerViewJobName.dataSource = self; pickerViewJobName.delegate = self; pickerViewJobName.tag = 1
        pickerViewJobName.frame = CGRect(x:0,y:0,width:760,height:300)
        pickerViewMechanic.dataSource = self; pickerViewMechanic.delegate = self; pickerViewMechanic.tag = 2
        pickerViewMechanic.frame = CGRect(x:0,y:0,width:440,height:200)
        modelHumidifier.isHidden = true; serialHumidifer.isHidden = true; ampsHumidifer.isHidden = true
        BMSvendortext.isHidden = true
        VoluteView.isHidden = true; PumpView.isHidden = true; WCCView.isHidden = true
        EvapView.isHidden = true; FanView.isHidden = true; Compressor1View.isHidden = true
        Compressor2View.isHidden = true; ACCView.isHidden = true; ChecklistView.isHidden = true
        NotesTopConstraint.constant = 20
        Construction_DisplayName = Array(Construction_Dict.keys); Maintenance_DisplayName = Array(Maintenance_Dict.keys)
        Mechanic_Names.sort(); Construction_DisplayName.sort(); Maintenance_DisplayName.sort()
        Customer_Data = Construction_DisplayName; Customer_Dict = Construction_Dict
        if Start_Name != "" {SendUpdates()}
        navigationController?.delegate = self
        
        if Construction_DisplayName.count == 0 || Maintenance_DisplayName.count == 0 || Mechanic_Names.count == 0{
            let alert = UIAlertController(title: "Database Loading Error", message: "Please confirm Internet Connection. Wait 10 seconds and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let Customer_Name = SelectJobNamelabel.text!
        let equipment = SelectEquipmentbutton.titleLabel!.text!
        if Customer_Name != "SELECT JOB NAME" || equipment != "Select Equipment"{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: datepicker.date)
            var unit_number = ""
            if equipment != "Pump"{
                unit_number = unitnumbertext.text!.uppercased()}
            else {unit_number = unitnumberPump.text!.uppercased()}
            if unit_number != "" {unit_number += " "}
            var Temp_Name = "\(unit_number)START UP SHEET - \(Customer_Name) - \(date_input)"
            if Start_Name != "" && email_sent == 1{(viewController as? ViewController)?.deleteSavedForm(name: Start_Name)}
            if email_sent == 1 {Temp_Name = "\(unit_number)START UP SHEET (SENT) - \(Customer_Name) - \(date_input)"}
            Temp_Dict = [Temp_Name:["STARTUP",Temp_Name,date_input,SelectJobNamelabel.text!,AddressLabel.text!,PMCjobnumber.text!,SelectMainMechaniclabel.text!,floortext.text!,equipment,EquipmentText.text!,unitnumbertext.text!,unitmaketext.text!,unitmodeltext.text!,unitserialtext.text!,FiltersText.text!,fanHPtext.text!,fanBelttext.text!,fanFrametext.text!,fanVoltage.titleLabel!.text!,fanAmpRatingtext.text!,fanAmpActualtext.text!,fanCoolingSA.text!,fanCoolingRA.text!,fanDeltaCooling.text!,fanHeatingSA.text!,fanHeatingRA.text!,fanDeltaHeating.text!,makeACC.text!,modelACC.text!,serialACC.text!,voltageACC.titleLabel!.text!,hpACC.text!,beltACC.text!,frameACC.text!,ampRatingACC.text!,ampActualACC.text!,incomingTemp.text!,dischargeTemp.text!,deltaACC.text!,makeWCC.text!,modelWCC.text!,serialWCC.text!,makeCompressor1text.text!,modelCompressor1text.text!,serialCompressor1text.text!,voltageCompressor1.titleLabel!.text!,refrigerantCompressor1text.text!,chargeLbsCompressor1.text!,chargeOzCompressor1.text!,highsideCompressor1.text!,lowsideCompressor1.text!,AmpRatingCompressor1.text!,AmpActualCompressor1.text!,enteringPressureCompressor1.text!,leavingPressureCompressor1.text!,enteringTemperatureCompressor1.text!,leavingTemperatureCompressor1.text!,makeCompressor2.text!,modelCompressor2.text!,serialCompressor2.text!,voltageCompressor2.titleLabel!.text!,refrigerantCompressor2.text!,chargeLbsCompressor2.text!,chargeOzCompressor2.text!,highsideCompressor2.text!,lowsideCompressor2.text!,AmpRatingCompressor2.text!,AmpActualCompressor2.text!,makePump.text!,modelPump.text!,voltagePump.titleLabel!.text!,systemPump.titleLabel!.text!,ampRatingPump.text!,ampActualPump.text!,enteringPressurePump.text!,leavingPressurePump.text!,enteringTemperaturePump.text!,leavingTemperaturePump.text!,makeVolute.text!,modelVolute.text!,serialVolute.text!,impellerVolute.text!,waterRegValve.titleLabel!.text!,leakDetectionTest.titleLabel!.text!,unitPitchedTowards.titleLabel!.text!,drainLine.titleLabel!.text!,condensatePumpTest.titleLabel!.text!,isBMS.titleLabel!.text!,BMSvendortext.text!,strainersCracked.titleLabel!.text!,pipeLabeling.titleLabel!.text!,humidifierbutton.titleLabel!.text!,serialHumidifer.text!,modelHumidifier.text!,ampsHumidifer.text!,ladderbutton.titleLabel!.text!,NotesText.text!,"\(selectedRowJobName)","\(selectedMainMechanic)",unitnumberPump.text!,thermostatgauge.titleLabel!.text!,autoisolationvalve.titleLabel!.text!,fanvoltageActual.text!,ACCvoltageActual.text!,voltageActualPump.text!,JobTypebutton.titleLabel!.text!]]
            (viewController as? ViewController)?.Temp_Dict = Temp_Dict
            (viewController as? ViewController)?.mergeDictionarys()
            (viewController as? ViewController)?.refreshTabel() // UPDATE LOCAL SAVE
        }
        (viewController as? ViewController)?.WriteSaveFormsFiles()
        (viewController as? ViewController)?.SavePostFiles()
    }
    
    func SendUpdates() {
        
        let formater = DateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        let date = formater.date(from: date_set) ?? Date()
        datepicker.setDate(date, animated: false)
        SelectJobNamelabel.text = job_name_set
        AddressLabel.text = address_set
        PMCjobnumber.text = job_number_set
        SelectMainMechaniclabel.text = mechanic_set
        floortext.text = floor_set
        EquipmentText.text = equipment_text_set
        unitnumbertext.text = unit_number_set
        unitmaketext.text = unit_make_set
        unitmodeltext.text = unit_model_set
        unitserialtext.text = unit_serial_set
        FiltersText.text = filters_set
        fanHPtext.text = fan_hp_set
        fanBelttext.text = fan_belt_set
        fanFrametext.text = fan_frame_set
        fanAmpRatingtext.text = fan_amprating_set
        fanAmpActualtext.text = fan_ampactual_set
        fanCoolingSA.text = fan_coolingSA_set
        fanCoolingRA.text = fan_coolingRA_set
        fanDeltaCooling.text = fan_coolingDelta_set
        fanHeatingSA.text = fan_heatingSA_set
        fanHeatingRA.text = fan_heatingRA_set
        fanDeltaHeating.text = fan_heatingDelta_set
        fanvoltageActual.text = fan_voltageactual_set
        makeACC.text = acc_make_set
        modelACC.text = acc_model_set
        serialACC.text = acc_serial_set
        hpACC.text = acc_hp_set
        beltACC.text = acc_belt_set
        frameACC.text = acc_frame_set
        ampRatingACC.text = acc_amprating_set
        ampActualACC.text = acc_ampactual_set
        ACCvoltageActual.text = acc_voltageactual_set
        incomingTemp.text = acc_incoming_set
        dischargeTemp.text = acc_discharge_set
        deltaACC.text = acc_delta_set
        makeWCC.text = wcc_make_set
        modelWCC.text = wcc_model_set
        serialWCC.text = wcc_serial_set
        makeCompressor1text.text = comp1_make_set
        modelCompressor1text.text = comp1_model_set
        serialCompressor1text.text = comp1_serial_set
        refrigerantCompressor1text.text = comp1_refrigerant_set
        chargeLbsCompressor1.text = comp1_chargelbs_set
        chargeOzCompressor1.text = comp1_chargeoz_set
        highsideCompressor1.text = comp1_highside_set
        lowsideCompressor1.text = comp1_lowside_set
        AmpRatingCompressor1.text = comp1_amprating_set
        AmpActualCompressor1.text = comp1_ampactual_set
        enteringPressureCompressor1.text = comp1_enteringpres_set
        leavingPressureCompressor1.text = comp1_leavingpres_set
        enteringTemperatureCompressor1.text = comp1_enteringtemp_set
        leavingTemperatureCompressor1.text = comp1_leavingtemp_set
        makeCompressor2.text = comp2_make_set
        modelCompressor2.text = comp2_model_set
        serialCompressor2.text = comp2_serial_set
        refrigerantCompressor2.text = comp2_refrigerant_set
        chargeLbsCompressor2.text = comp2_chargelbs_set
        chargeOzCompressor2.text = comp2_chargeoz_set
        highsideCompressor2.text = comp2_highside_set
        lowsideCompressor2.text = comp2_lowside_set
        AmpRatingCompressor2.text = comp2_amprating_set
        AmpActualCompressor2.text = comp2_ampactual_set
        makePump.text = pump_make_set
        modelPump.text = pump_model_set
        ampRatingPump.text = pump_amprating_set
        ampActualPump.text = pump_ampactual_set
        voltageActualPump.text = pump_voltageactual_set
        enteringPressurePump.text = pump_enteringpres_set
        leavingPressurePump.text = pump_leavingpres_set
        enteringTemperaturePump.text = pump_enteringtemp_set
        leavingTemperaturePump.text = pump_leavingtemp_set
        makeVolute.text = vol_make_set
        modelVolute.text = vol_model_set
        serialVolute.text = vol_serial_set
        impellerVolute.text = vol_impeller_set
        unitnumberPump.text = pump_unitnumber_set
        
        SelectEquipmentbutton?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == equipment_button_set {action.state = .on}
        }
        fanVoltage?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == fan_voltage_set {action.state = .on}
        }
        voltageACC?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == acc_voltage_set {action.state = .on}
        }
        voltageCompressor1?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == comp1_voltage_set {action.state = .on}
        }
        voltageCompressor2?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == comp2_voltage_set {action.state = .on}
        }
        voltagePump?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == pump_voltage_set {action.state = .on}
        }
        systemPump?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == pump_system_set {action.state = .on}
        }
        waterRegValve?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == water_reg_set {action.state = .on}
        }
        leakDetectionTest?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == leak_detection_set {action.state = .on}
        }
        unitPitchedTowards?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == unit_pitched_set {action.state = .on}
        }
        drainLine?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == drainline_set {action.state = .on}
        }
        condensatePumpTest?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == condensate_pump_set {action.state = .on}
        }
        isBMS?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == BMS_set {action.state = .on}
        }
        strainersCracked?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == strainers_set {action.state = .on}
        }
        thermostatgauge?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == thermostat_set {action.state = .on}
        }
        autoisolationvalve?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == autovalve_set {action.state = .on}
        }
        pipeLabeling?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == pipe_labeling_set {action.state = .on}
        }
        humidifierbutton?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == humidifier_set {action.state = .on}
        }
        ladderbutton?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == ladder_set {action.state = .on}
        }
        JobTypebutton?.menu?.children.forEach { action in
            guard let action = action as? UIAction else {return}
            if action.title == job_type_set {action.state = .on}
        }
        
        BMSvendortext.text = bms_vendor_set
        serialHumidifer.text = humid_serial_set
        modelHumidifier.text = humid_model_set
        ampsHumidifer.text = humid_amps_set
        NotesText.text = notes_set
        JobType_Data(); Display_Equipment(); DisplayBMSInfo(); DisplayHumidiferInfo()
        
    }
    
    func localSave(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let SavedForms_Data_Path = documentDirectory[0].appendingPathComponent("Saved-Forms-Data.txt")
        let Customer_Name = SelectJobNamelabel.text!
        let equipment = SelectEquipmentbutton.titleLabel!.text!
        if Customer_Name != "SELECT JOB NAME" || equipment != "Select Equipment"{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: datepicker.date)
            var unit_number = ""
            if equipment != "Pump"{unit_number = unitnumbertext.text!.uppercased()}
            else {unit_number = unitnumberPump.text!.uppercased()}
            if unit_number != "" {unit_number += " "}
            let Temp_Name = "\(unit_number)START UP SHEET - \(Customer_Name) - \(date_input)"
            
            Temp_Dict = [Temp_Name:["STARTUP",Temp_Name,date_input,SelectJobNamelabel.text!,AddressLabel.text!,PMCjobnumber.text!,SelectMainMechaniclabel.text!,floortext.text!,equipment,EquipmentText.text!,unitnumbertext.text!,unitmaketext.text!,unitmodeltext.text!,unitserialtext.text!,FiltersText.text!,fanHPtext.text!,fanBelttext.text!,fanFrametext.text!,fanVoltage.titleLabel!.text!,fanAmpRatingtext.text!,fanAmpActualtext.text!,fanCoolingSA.text!,fanCoolingRA.text!,fanDeltaCooling.text!,fanHeatingSA.text!,fanHeatingRA.text!,fanDeltaHeating.text!,makeACC.text!,modelACC.text!,serialACC.text!,voltageACC.titleLabel!.text!,hpACC.text!,beltACC.text!,frameACC.text!,ampRatingACC.text!,ampActualACC.text!,incomingTemp.text!,dischargeTemp.text!,deltaACC.text!,makeWCC.text!,modelWCC.text!,serialWCC.text!,makeCompressor1text.text!,modelCompressor1text.text!,serialCompressor1text.text!,voltageCompressor1.titleLabel!.text!,refrigerantCompressor1text.text!,chargeLbsCompressor1.text!,chargeOzCompressor1.text!,highsideCompressor1.text!,lowsideCompressor1.text!,AmpRatingCompressor1.text!,AmpActualCompressor1.text!,enteringPressureCompressor1.text!,leavingPressureCompressor1.text!,enteringTemperatureCompressor1.text!,leavingTemperatureCompressor1.text!,makeCompressor2.text!,modelCompressor2.text!,serialCompressor2.text!,voltageCompressor2.titleLabel!.text!,refrigerantCompressor2.text!,chargeLbsCompressor2.text!,chargeOzCompressor2.text!,highsideCompressor2.text!,lowsideCompressor2.text!,AmpRatingCompressor2.text!,AmpActualCompressor2.text!,makePump.text!,modelPump.text!,voltagePump.titleLabel!.text!,systemPump.titleLabel!.text!,ampRatingPump.text!,ampActualPump.text!,enteringPressurePump.text!,leavingPressurePump.text!,enteringTemperaturePump.text!,leavingTemperaturePump.text!,makeVolute.text!,modelVolute.text!,serialVolute.text!,impellerVolute.text!,waterRegValve.titleLabel!.text!,leakDetectionTest.titleLabel!.text!,unitPitchedTowards.titleLabel!.text!,drainLine.titleLabel!.text!,condensatePumpTest.titleLabel!.text!,isBMS.titleLabel!.text!,BMSvendortext.text!,strainersCracked.titleLabel!.text!,pipeLabeling.titleLabel!.text!,humidifierbutton.titleLabel!.text!,serialHumidifer.text!,modelHumidifier.text!,ampsHumidifer.text!,ladderbutton.titleLabel!.text!,NotesText.text!,"\(selectedRowJobName)","\(selectedMainMechanic)",unitnumberPump.text!,thermostatgauge.titleLabel!.text!,autoisolationvalve.titleLabel!.text!,fanvoltageActual.text!,ACCvoltageActual.text!,voltageActualPump.text!,JobTypebutton.titleLabel!.text!]]
            
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
    
    func ActualJobNameDropDown(){
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:780,height: 300)
        let alert = UIAlertController(title: "SELECT JOB NAME", message: "Customer Address and Job Number will update once selected.", preferredStyle: .actionSheet)
        pickerViewJobName.selectRow(selectedRowJobName,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewJobName)
        pickerViewJobName.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewJobName.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = SelectJobNamelabel
        alert.popoverPresentationController?.sourceRect = SelectJobNamelabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            self.selectedRowJobName = self.pickerViewJobName.selectedRow(inComponent: 0)
            let display_name = self.Customer_Data[self.selectedRowJobName]
            self.SelectJobNamelabel.text = display_name.uppercased()
            self.AddressLabel.text = self.Customer_Dict[display_name]?[1].uppercased()
            self.PMCjobnumber.text = self.Customer_Dict[display_name]?[3]
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func JobNameDropDown(_ sender: Any) {
        ActualJobNameDropDown()
    }
    
    @objc func CustomerLabelDropDown(sender: UITapGestureRecognizer) {
        ActualJobNameDropDown()
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(CustomerLabelDropDown))
        SelectJobNamelabel.isUserInteractionEnabled = true
        SelectJobNamelabel.addGestureRecognizer(labelTap)
        
        let labelTap2 = UITapGestureRecognizer(target: self, action: #selector(MechanicLabelDropDown))
        SelectMainMechaniclabel.isUserInteractionEnabled = true
        SelectMainMechaniclabel.addGestureRecognizer(labelTap2)
    }
    
    @IBAction func MainMechanicDropDown(_ sender: Any) {
        ActualMechanicDropDown()
    }
    
    @objc func MechanicLabelDropDown(sender: UITapGestureRecognizer) {
        ActualMechanicDropDown()
    }
    
    func ActualMechanicDropDown(){
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width:450,height: 200)
        let alert = UIAlertController(title: "Select Primary Mechanic", message: "", preferredStyle: .actionSheet)
        pickerViewMechanic.selectRow(selectedMainMechanic,inComponent: 0,animated: false)
        vc.view.addSubview(pickerViewMechanic)
        pickerViewMechanic.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerViewMechanic.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        alert.popoverPresentationController?.sourceView = SelectMainMechaniclabel
        alert.popoverPresentationController?.sourceRect = SelectMainMechaniclabel.bounds
        alert.setValue(vc, forKey: "contentViewController")
        // alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction) in }))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler:{
            (UIAlertAction) in
            self.selectedMainMechanic = self.pickerViewMechanic.selectedRow(inComponent: 0)
            self.SelectMainMechaniclabel.text = self.Mechanic_Names[self.selectedMainMechanic].uppercased()
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    func JobType_Data() {
        let name = JobTypebutton.menu?.selectedElements.first?.title

        if name == "Construction" {
            Customer_Data = Construction_DisplayName; Customer_Dict = Construction_Dict
        } else {
            Customer_Data = Maintenance_DisplayName; Customer_Dict = Maintenance_Dict
        }
    }
    
    func setUpButtonMenu(){
        let optionClosure = {(action:UIAction) in print(action.title)}
        let EquipmentClosure = {(action:UIAction) in self.Display_Equipment()}
        let JobTypeClosure = {(action:UIAction) in self.JobType_Data()}
        
        JobTypebutton.menu = UIMenu(children: [
            UIAction(title:"Construction",handler:JobTypeClosure),
            UIAction(title:"Maintenance",handler:JobTypeClosure)])
        JobTypebutton.showsMenuAsPrimaryAction = true
        JobTypebutton.changesSelectionAsPrimaryAction = true
     
        SelectEquipmentbutton.menu = UIMenu(children: [
            UIAction(title:"Select Equipment",handler:EquipmentClosure),
            UIAction(title:"Pump",handler:EquipmentClosure),
            UIAction(title:"Air Cooled Split",handler:EquipmentClosure),
            UIAction(title:"Water Cooled Split",handler:EquipmentClosure),
            UIAction(title:"Air Cooled Packaged",handler:EquipmentClosure),
            UIAction(title:"Water Cooled Packaged",handler:EquipmentClosure),
            UIAction(title:"Manual Entry - WC",handler:EquipmentClosure),
            UIAction(title:"Manual Entry - AC",handler:EquipmentClosure)])
        SelectEquipmentbutton.showsMenuAsPrimaryAction = true
        SelectEquipmentbutton.changesSelectionAsPrimaryAction = true
        
        systemPump.menu = UIMenu(children: [
            UIAction(title:"Select System",handler:optionClosure),
            UIAction(title:"Chilled Water",handler:optionClosure),
            UIAction(title:"Hot Water",handler:optionClosure),
            UIAction(title:"Condenser Water",handler:optionClosure)])
        systemPump.showsMenuAsPrimaryAction = true
        systemPump.changesSelectionAsPrimaryAction = true

        fanVoltage.menu = UIMenu(children: [
            UIAction(title:"Select Voltage",handler:optionClosure),
            UIAction(title:"115V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"208V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"230V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"277V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"460V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"575V / 3Ph / 60Hz",handler:optionClosure)])
        fanVoltage.showsMenuAsPrimaryAction = true
        fanVoltage.changesSelectionAsPrimaryAction = true
        
        voltageCompressor1.menu = UIMenu(children: [
            UIAction(title:"Select Voltage",handler:optionClosure),
            UIAction(title:"115V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"208V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"230V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"277V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"460V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"575V / 3Ph / 60Hz",handler:optionClosure)])
        voltageCompressor1.showsMenuAsPrimaryAction = true
        voltageCompressor1.changesSelectionAsPrimaryAction = true
        
        voltageCompressor2.menu = UIMenu(children: [
            UIAction(title:"Select Voltage",handler:optionClosure),
            UIAction(title:"115V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"208V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"230V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"277V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"460V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"575V / 3Ph / 60Hz",handler:optionClosure)])
        voltageCompressor2.showsMenuAsPrimaryAction = true
        voltageCompressor2.changesSelectionAsPrimaryAction = true
        
        voltagePump.menu = UIMenu(children: [
            UIAction(title:"Select Voltage",handler:optionClosure),
            UIAction(title:"115V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"208V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"230V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"277V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"460V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"575V / 3Ph / 60Hz",handler:optionClosure)])
        voltagePump.showsMenuAsPrimaryAction = true
        voltagePump.changesSelectionAsPrimaryAction = true
        
        voltageACC.menu = UIMenu(children: [
            UIAction(title:"Select Voltage",handler:optionClosure),
            UIAction(title:"115V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"208V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"230V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"277V / 1Ph / 60Hz",handler:optionClosure),
            UIAction(title:"460V / 3Ph / 60Hz",handler:optionClosure),
            UIAction(title:"575V / 3Ph / 60Hz",handler:optionClosure)])
        voltageACC.showsMenuAsPrimaryAction = true
        voltageACC.changesSelectionAsPrimaryAction = true
        
        waterRegValve.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"2 Way",handler:optionClosure),
            UIAction(title:"3 Way",handler:optionClosure),
            UIAction(title:"None",handler:optionClosure)])
        waterRegValve.showsMenuAsPrimaryAction = true
        waterRegValve.changesSelectionAsPrimaryAction = true
        
        leakDetectionTest.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        leakDetectionTest.showsMenuAsPrimaryAction = true
        leakDetectionTest.changesSelectionAsPrimaryAction = true
        
        unitPitchedTowards.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        unitPitchedTowards.showsMenuAsPrimaryAction = true
        unitPitchedTowards.changesSelectionAsPrimaryAction = true
        
        drainLine.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        drainLine.showsMenuAsPrimaryAction = true
        drainLine.changesSelectionAsPrimaryAction = true
        
        condensatePumpTest.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        condensatePumpTest.showsMenuAsPrimaryAction = true
        condensatePumpTest.changesSelectionAsPrimaryAction = true
        
        let optionBMS = {(action:UIAction) in self.DisplayBMSInfo()}
        isBMS.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionBMS),
            UIAction(title:"Yes",handler:optionBMS),
            UIAction(title:"No",handler:optionBMS)])
        isBMS.showsMenuAsPrimaryAction = true
        isBMS.changesSelectionAsPrimaryAction = true
        
        strainersCracked.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        strainersCracked.showsMenuAsPrimaryAction = true
        strainersCracked.changesSelectionAsPrimaryAction = true
        
        thermostatgauge.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        thermostatgauge.showsMenuAsPrimaryAction = true
        thermostatgauge.changesSelectionAsPrimaryAction = true
        
        autoisolationvalve.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure),
            UIAction(title:"None",handler:optionClosure)])
        autoisolationvalve.showsMenuAsPrimaryAction = true
        autoisolationvalve.changesSelectionAsPrimaryAction = true
        
        pipeLabeling.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"Yes",handler:optionClosure),
            UIAction(title:"No",handler:optionClosure)])
        pipeLabeling.showsMenuAsPrimaryAction = true
        pipeLabeling.changesSelectionAsPrimaryAction = true
        
        let optionHumidifer = {(action:UIAction) in self.DisplayHumidiferInfo()}

        humidifierbutton.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionHumidifer),
            UIAction(title:"Yes",handler:optionHumidifer),
            UIAction(title:"No",handler:optionHumidifer)])
        humidifierbutton.showsMenuAsPrimaryAction = true
        humidifierbutton.changesSelectionAsPrimaryAction = true
        
        ladderbutton.menu = UIMenu(children: [
            UIAction(title:"Select Option",handler:optionClosure),
            UIAction(title:"6 Foot",handler:optionClosure),
            UIAction(title:"8 Foot",handler:optionClosure),
            UIAction(title:"10 Foot",handler:optionClosure)])
        ladderbutton.showsMenuAsPrimaryAction = true
        ladderbutton.changesSelectionAsPrimaryAction = true
        
    }
    
    func Display_Equipment(){
        let name = SelectEquipmentbutton.menu?.selectedElements.first?.title
        if name == "Air Cooled Split"{
            viewHeightConstraint.constant = 2600
            CompressorTopConstraint.constant = 920
            ChecklistTopConstraint.constant = 1555
            NotesTopConstraint.constant = 1940
            ACCInfolabel.text = "AIR COOLED CONDENSER INFO:"
            UnitInfolabel.text = "UNIT INFO:"
            fanInfolabel.text = "EVAPORATOR FAN INFO:"
            unitPitchedTowardslabel.text = "IS UNIT PITCHED TOWARDS DRAIN:"
            leakDetectionlabelConstraint.constant = 50; leakDetectionbuttonConstraint.constant = 19
            BMSViewConstraint.constant = 210
            pipelabelingTopConstraint.constant = 250; pipelabelingbuttonTopConstraint.constant = 249
            ladderlabelTopConstraint.constant = 330; ladderbuttonTopConstraint.constant = 329
            waterRegValvelabel.isHidden = true; waterRegValve.isHidden = true
            strainersCrackedlabel.isHidden = true; strainersCracked.isHidden = true
            thermostatgaugelabel.isHidden = true; thermostatgauge.isHidden = true
            autoisolationvalvelabel.isHidden = true; autoisolationvalve.isHidden = true
            humidifierlabel.isHidden = false; humidifierbutton.isHidden = false
            drainLinelabel.isHidden = false; drainLine.isHidden = false
            condensatePumptestlabel.isHidden = false; condensatePumpTest.isHidden = false
            VoluteView.isHidden = true; PumpView.isHidden = true; WCCView.isHidden = true
            enteringPressurelabel.isHidden = true; enteringPressureCompressor1.isHidden = true
            leavingPressurelabel.isHidden = true; leavingPressureCompressor1.isHidden = true
            enteringTemperaturelabel.isHidden = true; enteringTemperatureCompressor1.isHidden = true
            leavingTemperaturelabel.isHidden = true; leavingTemperatureCompressor1.isHidden = true
            ACCvoltageActual.isHidden = false; ACCvoltageActualLabel.isHidden = false
            Compressor1HeightConstraint.constant = 297
            EvapView.isHidden = false
            FanView.isHidden = false
            Compressor1View.isHidden = false
            Compressor2View.isHidden = false
            ACCView.isHidden = false
            ChecklistView.isHidden = false
            self.viewHeight = viewHeightConstraint.constant
            
        }
        else if name == "Water Cooled Split" || name == "Water Cooled Packaged" || name == "Manual Entry - WC"{
            viewHeightConstraint.constant = 2725
            WWCTopConstraint.constant = 544
            CompressorTopConstraint.constant = 730
            ChecklistTopConstraint.constant = 1523
            NotesTopConstraint.constant = 2067
            UnitInfolabel.text = "EVAPORATOR INFO:"
            fanInfolabel.text = "FAN INFO:"
            VoluteView.isHidden = true; PumpView.isHidden = true
            WCCView.isHidden = false
            EvapView.isHidden = false
            FanView.isHidden = false
            Compressor1View.isHidden = false
            Compressor2View.isHidden = false
            ACCView.isHidden = true
            ChecklistView.isHidden = false
            Compressor1HeightConstraint.constant = 456
            leakDetectionlabelConstraint.constant = 90; leakDetectionbuttonConstraint.constant = 59
            BMSViewConstraint.constant = 250
            pipelabelingTopConstraint.constant = 410; pipelabelingbuttonTopConstraint.constant = 409
            ladderlabelTopConstraint.constant = 490; ladderbuttonTopConstraint.constant = 489
            unitPitchedTowardslabel.text = "IS UNIT PITCHED TOWARDS DRAIN:"
            waterRegValvelabel.isHidden = false; waterRegValve.isHidden = false
            strainersCrackedlabel.isHidden = false; strainersCracked.isHidden = false
            thermostatgaugelabel.isHidden = false; thermostatgauge.isHidden = false
            autoisolationvalvelabel.isHidden = false; autoisolationvalve.isHidden = false
            drainLinelabel.isHidden = false; drainLine.isHidden = false
            condensatePumptestlabel.isHidden = false; condensatePumpTest.isHidden = false
            humidifierlabel.isHidden = false; humidifierbutton.isHidden = false
            enteringPressurelabel.isHidden = false; enteringPressureCompressor1.isHidden = false
            leavingPressurelabel.isHidden = false; leavingPressureCompressor1.isHidden = false
            enteringTemperaturelabel.isHidden = false; enteringTemperatureCompressor1.isHidden = false
            leavingTemperaturelabel.isHidden = false; leavingTemperatureCompressor1.isHidden = false
            self.viewHeight = viewHeightConstraint.constant
        }
        else if name == "Air Cooled Packaged" || name == "Manual Entry - AC"{
            viewHeightConstraint.constant = 2600
            CompressorTopConstraint.constant = 920
            ChecklistTopConstraint.constant = 1555
            NotesTopConstraint.constant = 1940
            UnitInfolabel.text = "EVAPORATOR INFO:"
            fanInfolabel.text = "FAN INFO:"
            ACCInfolabel.text = "CONDENSER FAN INFO:"
            VoluteView.isHidden = true; PumpView.isHidden = true; WCCView.isHidden = true
            unitPitchedTowardslabel.text = "IS UNIT PITCHED TOWARDS DRAIN:"
            waterRegValvelabel.isHidden = true; waterRegValve.isHidden = true
            strainersCrackedlabel.isHidden = true; strainersCracked.isHidden = true
            thermostatgaugelabel.isHidden = true; thermostatgauge.isHidden = true
            autoisolationvalvelabel.isHidden = true; autoisolationvalve.isHidden = true
            drainLinelabel.isHidden = false; drainLine.isHidden = false
            condensatePumptestlabel.isHidden = false; condensatePumpTest.isHidden = false
            humidifierlabel.isHidden = false; humidifierbutton.isHidden = false
            enteringPressurelabel.isHidden = true; enteringPressureCompressor1.isHidden = true
            leavingPressurelabel.isHidden = true; leavingPressureCompressor1.isHidden = true
            enteringTemperaturelabel.isHidden = true; enteringTemperatureCompressor1.isHidden = true
            leavingTemperaturelabel.isHidden = true; leavingTemperatureCompressor1.isHidden = true
            Compressor1HeightConstraint.constant = 297
            leakDetectionlabelConstraint.constant = 50; leakDetectionbuttonConstraint.constant = 19
            pipelabelingTopConstraint.constant = 250; pipelabelingbuttonTopConstraint.constant = 249
            ladderlabelTopConstraint.constant = 330; ladderbuttonTopConstraint.constant = 329
            if name == "Air Cooled Packaged" {
                ACCvoltageActual.isHidden = true; ACCvoltageActualLabel.isHidden = true}
            else {ACCvoltageActual.isHidden = false; ACCvoltageActualLabel.isHidden = false}
            BMSViewConstraint.constant = 210
            EvapView.isHidden = false
            FanView.isHidden = false
            Compressor1View.isHidden = false
            Compressor2View.isHidden = false
            ACCView.isHidden = false
            ChecklistView.isHidden = false
            self.viewHeight = viewHeightConstraint.constant
        }
        else if name == "Pump"{
            viewHeightConstraint.constant = 1630
            PumpTopConstraint.constant = 20
            ChecklistTopConstraint.constant = 630
            NotesTopConstraint.constant = 975
            leakDetectionlabelConstraint.constant = 50; leakDetectionbuttonConstraint.constant = 19
            BMSViewConstraint.constant = 130
            pipelabelingTopConstraint.constant = 250; pipelabelingbuttonTopConstraint.constant = 249
            ladderlabelTopConstraint.constant = 290; ladderbuttonTopConstraint.constant = 289
            VoluteView.isHidden = false; PumpView.isHidden = false
            waterRegValvelabel.isHidden = true; waterRegValve.isHidden = true
            unitPitchedTowardslabel.text = "PUMP ROTATION CHECKED:"
            drainLinelabel.isHidden = true; drainLine.isHidden = true
            condensatePumptestlabel.isHidden = true; condensatePumpTest.isHidden = true
            strainersCrackedlabel.isHidden = false; strainersCracked.isHidden = false
            thermostatgaugelabel.isHidden = false; thermostatgauge.isHidden = false
            autoisolationvalvelabel.isHidden = true; autoisolationvalve.isHidden = true
            humidifierlabel.isHidden = true; humidifierbutton.isHidden = true
            WCCView.isHidden = true
            EvapView.isHidden = true; FanView.isHidden = true
            Compressor1View.isHidden = true; Compressor2View.isHidden = true
            ACCView.isHidden = true
            ChecklistView.isHidden = false
            self.viewHeight = viewHeightConstraint.constant
            humidifierbutton.menu?.children.forEach { action in
                        guard let action = action as? UIAction else {return}
                        if action.title == "Select Option" {action.state = .on}
                    }
            self.DisplayHumidiferInfo()
        }
        else {
            VoluteView.isHidden = true; PumpView.isHidden = true; WCCView.isHidden = true
            EvapView.isHidden = true; FanView.isHidden = true; Compressor1View.isHidden = true
            Compressor2View.isHidden = true; ACCView.isHidden = true; ChecklistView.isHidden = true
            NotesTopConstraint.constant = 20
            viewHeightConstraint.constant = 680
            self.viewHeight = viewHeightConstraint.constant
            
        }
        if name == "Manual Entry - WC" || name == "Manual Entry - AC" {
            EquipmentText.isHidden = false
        } else {
            EquipmentText.isHidden = true
        }
    }
    
    
    func DisplayHumidiferInfo() {
        let name = humidifierbutton.menu?.selectedElements.first?.title
        if name == "Yes" {
            modelHumidifier.isHidden = false; modelHumidiferlabel.isHidden = false; serialHumidifer.isHidden = false
            serialHumidiferlabel.isHidden = false; ampsHumidifer.isHidden = false; ampsHumidiferlabel.isHidden = false
        }
        else {
            modelHumidifier.isHidden = true; modelHumidiferlabel.isHidden = true; serialHumidifer.isHidden = true
            serialHumidiferlabel.isHidden = true; ampsHumidifer.isHidden = true; ampsHumidiferlabel.isHidden = true
        }
    }
    
    func DisplayBMSInfo() {
        let name = isBMS.menu?.selectedElements.first?.title
        if name == "Yes" {BMSvendortext.isHidden = false; BMSvendorLabel.isHidden = false}
        else {BMSvendortext.isHidden = true; BMSvendorLabel.isHidden = true}
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
            let use_width = (current_width - 331) / 3
            fanHpWidthConstraint.constant = use_width
            fanBeltWidthConstarint.constant = use_width
            hpACCWidthConstraint.constant = use_width
            betlACCWidthConstraint.constant = use_width
            SelectJobNameWidthConstaint.constant = current_width - 420
            AddressWidthConstraint.constant = current_width - 410
        }
        else {
            previous_orientation = current_orientation
            let use_width = (current_height - 331) / 3
            fanHpWidthConstraint.constant = use_width
            fanBeltWidthConstarint.constant = use_width
            hpACCWidthConstraint.constant = use_width
            betlACCWidthConstraint.constant = use_width
            SelectJobNameWidthConstaint.constant = current_height - 420
            AddressWidthConstraint.constant = current_height - 410
        }
    }
    
    func rotateNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        let current_width = UIScreen.main.bounds.size.width
        let current_height = UIScreen.main.bounds.size.height
        if current_width > current_height {self.previous_orientation = "Landscape"}
        else if current_width < current_height {self.previous_orientation = "Portrait"}
        let use_width = (current_width - 331) / 3
        fanHpWidthConstraint.constant = use_width
        fanBeltWidthConstarint.constant = use_width
        hpACCWidthConstraint.constant = use_width
        betlACCWidthConstraint.constant = use_width
        SelectJobNameWidthConstaint.constant = current_width - 420
        AddressWidthConstraint.constant = current_width - 410

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
    

    @IBAction func CoolingTemp(_ sender: Any) {
        let SA_Temp = NumberFormatter().number(from: fanCoolingSA.text!)
        let RA_Temp = NumberFormatter().number(from: fanCoolingRA.text!)
        let Delta_T = round((Float(truncating: RA_Temp ?? 0) - Float(truncating: SA_Temp ?? 0))*100) / 100
        fanDeltaCooling.text = "\(Delta_T)"
        
    }
    
    @IBAction func HeatingTemp(_ sender: Any) {
        let SA_Temp = NumberFormatter().number(from: fanHeatingSA.text!)
        let RA_Temp = NumberFormatter().number(from: fanHeatingRA.text!)
        let Delta_T = round((Float(truncating: SA_Temp ?? 0) - Float(truncating: RA_Temp ?? 0))*100) / 100
        fanDeltaHeating.text = "\(Delta_T)"
        
    }
    
    @IBAction func DischargeTemp(_ sender: Any) {
        let SA_Temp = NumberFormatter().number(from: incomingTemp.text!)
        let RA_Temp = NumberFormatter().number(from: dischargeTemp.text!)
        let Delta_T = round((Float(truncating: RA_Temp ?? 0) - Float(truncating: SA_Temp ?? 0))*100) / 100
        deltaACC.text = "\(Delta_T)"
        
    }
    
    func createFlyer() -> Data {
        // 1
        let author = SelectMainMechaniclabel.text!
        let equipment = SelectEquipmentbutton.titleLabel!.text!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date_input = dateFormatter.string(from: datepicker.date)
        let title = "Pierpont Mechanical_" + self.title_page + "_\(date_input)"
        let pdfMetaData = [
            kCGPDFContextCreator: "Pierpont Mechanical",
            kCGPDFContextAuthor: author,
            kCGPDFContextTitle: title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        // Page Setup
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
    
        let data = renderer.pdfData { (context) in
            // 5
            context.beginPage()
            
            if let graphic_context = UIGraphicsGetCurrentContext(){
                let rect = CGRect(x: 0, y: 0, width: 612, height: 792)
                graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                graphic_context.fill(rect)
            }
            
            let aspectRatio = pageRect.width * 0.22 / (self.logo_image?.size.width ?? 0)
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
            address1.draw(at: CGPoint(x: 470, y: 23), withAttributes: attributes as [NSAttributedString.Key : Any])
            address2.draw(at: CGPoint(x: 470, y: 33), withAttributes: attributes as [NSAttributedString.Key : Any])
            address3.draw(at: CGPoint(x: 470, y: 43), withAttributes: attributes as [NSAttributedString.Key : Any])
            address4.draw(at: CGPoint(x: 470, y: 53), withAttributes: attributes as [NSAttributedString.Key : Any])
            
            // 1
            let titleFont = UIFont(name:"AlegreyaSansSC-ExtraBold",size: 24)
            let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont]
            let attributedTitle = NSAttributedString(string: self.title_page, attributes: titleAttributes)
            let titleStringSize = attributedTitle.size()
            let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                        y: 25, width: titleStringSize.width,
                                        height: titleStringSize.height)
            attributedTitle.draw(in: titleStringRect)
            
            attributes = [NSAttributedString.Key.font: UIFont(name:"Roboto-Bold",size: 10)]
            let attributes_white = [NSAttributedString.Key.font: UIFont(name:"AlegreyaSansSC-Bold",size: 11), NSAttributedString.Key.foregroundColor : UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1)]
            var textFont = [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)]
            var label00 = "UNIT INFO:"
            let label0 = "EQUIPMENT TYPE:"
            let label1 = "MECHANIC NAME:"
            let label2 = "JOB NAME:"
            let label3 = "ADDRESS:"
            let label4 = "PMC JOB#:"
            let label5 = "DATE:"
            let label6 = "FLOOR:"
            let label7 = "FILTERS:"
            let label8 = "UNIT#:"
            let label9 = "MAKE:"
            let label10 = "MODEL:"
            let label11 = "SERIAL:"
            var label12 = "FAN INFO:"
            let label13 = "HP:"
            let label14 = "BELT:"
            let label15 = "FRAME:"
            let label16 = "VOLTS:"
            let label17 = "AMPS RATING:"
            let label18 = "AMPS ACTUAL:"
            let label19 = "COOLING SA TEMP:"
            let label20 = "COOLING RA TEMP:"
            let label21 = "DELTA T:"
            let label22 = "HEATING SA TEMP:"
            let label23 = "HEATING RA TEMP:"
            let label24 = "COMPRESSOR #1 INFO:"
            let label25 = "COMPRESSOR #2 INFO:"
            let label26 = "REFRIGERANT:"
            let label27 = "HIGH SIDE:"
            let label28 = "LOW SIDE:"
            let label32 = "CHARGE:"
            let label34 = "ENTERING WATER PSI:"
            let label35 = "ENTERING WATER TEMP:"
            let label36 = "LEAVING WATER PSI:"
            let label37 = "LEAVING WATER TEMP:"
            let label38 = "CIRCULATING PUMP MOTOR INFO:"
            var label39 = "AIR COOLED CONDENSER INFO:"
            let label40 = "CHECKLIST:"
            let label41 = "WATER REG VALVE:"
            let label42 = "LEAK DETECTION TESTED AND LEFT OPERATIONAL:"
            let label43 = "IS UNIT PITCHED TOWARDS DRAIN:"
            let label44 = "DRAIN LINE COMPLETE AND TESTED:"
            let label45 = "CONDENSATE PUMP TESTED AND LEFT OPERATIONAL:"
            let label46 = "IS THERE A BMS:"
            let label47 = "HAVE THE STRAINERS BEEN CRACKED:"
            let label48 = "PIPE LABELING DONE:"
            let label49 = "HUMIDIFER:"
            let label50 = "AMPS:"
            let label51 = "LADDER:"
            let label52 = "NOTES:"
            let label53 = "INCOMING AIR TEMP:"
            let label54 = "DISCHARGE AIR TEMP:"
            let label55 = "PUMP VOLUTE INFO:"
            let label56 = "THERMOSTATS AND GAUGES INSTALLED AND SEATED:"
            let label57 = "AUTOMATIC ISOLATION VALVES FULLY OPERATIONAL:"
            let label58 = "VOLTS ACTUAL:"
            
            var base_set = [0]
            if equipment == "Air Cooled Packaged" || equipment == "Manual Entry - AC"{
                base_set = [90,153,231,323,457,566,90,224]
                label39 = "CONDENSER FAN INFO:"
            } else if equipment == "Air Cooled Split"{
                base_set = [90,153,231,323,457,566,90,224]
                label12 = "EVAPORATOR FAN INFO:"
            } else if equipment == "Water Cooled Packaged" || equipment == "Water Cooled Split" || equipment == "Manual Entry - WC" {
                base_set = [90,153,231,323,387,526,90,280]
                label00 = "EVAPORATOR INFO:"
            } else if equipment == "Pump" {
                base_set = [90,153,274,352,473,0,0,0]
            }
            
            // Create Filled Color Rects
            if let graphic_context = UIGraphicsGetCurrentContext(){
                graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                var rect = CGRect(x: 20, y: base_set[1], width: 572, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: base_set[2], width: 572, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: base_set[3], width: 572, height: 13)
                graphic_context.fill(rect)
                rect = CGRect(x: 20, y: base_set[4], width: 572, height: 13)
                graphic_context.fill(rect)
                if equipment != "Pump" {
                    rect = CGRect(x: 20, y: base_set[5], width: 572, height: 13)
                    graphic_context.fill(rect)
                }
            }
            
            var base = base_set[0]
            var height = 14
            var offset = 15
            label2.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes as [NSAttributedString.Key : Any])
            label3.draw(at: CGPoint(x: 25, y: base+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
            label1.draw(at: CGPoint(x: 25, y: base+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
            label4.draw(at: CGPoint(x: 25, y: base+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
            author.draw(at: CGPoint(x: 115, y: base+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
            SelectJobNamelabel.text?.draw(at: CGPoint(x: 83, y: base), withAttributes: textFont as [NSAttributedString.Key : Any])
            AddressLabel.text?.draw(at: CGPoint(x: 77, y: base+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
            PMCjobnumber.text?.draw(at: CGPoint(x: 82, y: base+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
            // Top Left
            label5.draw(at: CGPoint(x: 470, y: base), withAttributes: attributes as [NSAttributedString.Key : Any])
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_ = dateFormatter.string(from: datepicker.date)
            date_.draw(at: CGPoint(x: 502, y: base), withAttributes: textFont as [NSAttributedString.Key : Any])
            label6.draw(at: CGPoint(x: 470, y: base+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
            floortext.text?.draw(at: CGPoint(x: 508, y: base+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])

            if equipment == "Air Cooled Split" || equipment == "Air Cooled Packaged" || equipment == "Water Cooled Split" || equipment == "Water Cooled Packaged" || equipment == "Manual Entry - WC" || equipment == "Manual Entry - AC"{
                // Unit Info
                base = base_set[1]
                label00.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label8.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label9.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label10.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label11.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label0.draw(at: CGPoint(x: 203, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                if equipment != "Manual Entry - WC" && equipment != "Manual Entry - AC"{
                    equipment.draw(at: CGPoint(x: 295, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                } else {
                    EquipmentText.text?.draw(at: CGPoint(x: 295, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
                label7.draw(at: CGPoint(x: 410, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                unitnumbertext.text?.draw(at: CGPoint(x: 62, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitmaketext.text?.draw(at: CGPoint(x: 62, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitmodeltext.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitserialtext.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .natural
                paragraphStyle.lineBreakMode = .byWordWrapping
                // 3
                let textFontpar = [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
                ]
                let filters_text = NSAttributedString(string: FiltersText.text, attributes: textFontpar)
                
                filters_text.draw(in: CGRect(x: 454, y: base+offset, width: 138,height: 60))
                
                // Fan Info
                base = base_set[2]
                label12.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label13.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label16.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label19.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label20.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label21.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
            
                    // Middle
                label14.draw(at: CGPoint(x: 220, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label17.draw(at: CGPoint(x: 220, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label22.draw(at: CGPoint(x: 220, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label23.draw(at: CGPoint(x: 220, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label21.draw(at: CGPoint(x: 220, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                    // Right
                label15.draw(at: CGPoint(x: 410, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label18.draw(at: CGPoint(x: 410, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label58.draw(at: CGPoint(x: 410, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                fanHPtext.text?.draw(at: CGPoint(x: 48, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                fanVoltage.titleLabel?.text?.draw(at: CGPoint(x: 64, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanCoolingSA.text!) °F".draw(at: CGPoint(x: 120, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanCoolingRA.text!) °F".draw(at: CGPoint(x: 120, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanDeltaCooling.text!) °F".draw(at: CGPoint(x: 70, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                    // Middle
                fanBelttext.text?.draw(at: CGPoint(x: 253, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                fanAmpRatingtext.text?.draw(at: CGPoint(x: 295, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanHeatingSA.text!) °F".draw(at: CGPoint(x: 315, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanHeatingRA.text!) °F".draw(at: CGPoint(x: 315, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(fanDeltaHeating.text!) °F".draw(at: CGPoint(x: 265, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                    //Right
                fanFrametext.text?.draw(at: CGPoint(x: 453, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                fanAmpActualtext.text?.draw(at: CGPoint(x: 488, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                fanvoltageActual.text?.draw(at: CGPoint(x: 490, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                
                if equipment == "Air Cooled Packaged" || equipment == "Air Cooled Split" || equipment == "Manual Entry - AC"{
                    // Air Condenser Info
                    base = base_set[3]
                    label39.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                    label9.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label10.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label11.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                    label13.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label17.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label53.draw(at: CGPoint(x: 25, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label54.draw(at: CGPoint(x: 25, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label21.draw(at: CGPoint(x: 25, y: base+offset+(height*7)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                        // Middle
                    label16.draw(at: CGPoint(x: 220, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                    if equipment != "Air Cooled Packaged" {
                        label58.draw(at: CGPoint(x: 220, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                        ACCvoltageActual.text?.draw(at: CGPoint(x: 298, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    }
                    
                    label14.draw(at: CGPoint(x: 220, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label18.draw(at: CGPoint(x: 220, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    
                        // Right
                    label15.draw(at: CGPoint(x: 410, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    
                    makeACC.text?.draw(at: CGPoint(x: 62, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                    modelACC.text?.draw(at: CGPoint(x: 67, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    serialACC.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    hpACC.text?.draw(at: CGPoint(x: 47, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    ampRatingACC.text?.draw(at: CGPoint(x: 100, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(incomingTemp.text!) °F".draw(at: CGPoint(x: 130, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(dischargeTemp.text!) °F".draw(at: CGPoint(x: 135, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(deltaACC.text!) °F".draw(at: CGPoint(x: 70, y: base+offset+(height*7)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    
                        // Middle
                    voltageACC.titleLabel?.text?.draw(at: CGPoint(x: 260, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                    beltACC.text?.draw(at: CGPoint(x: 253, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    ampActualACC.text?.draw(at: CGPoint(x: 298, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    
                        // Right
                    frameACC.text?.draw(at: CGPoint(x: 453, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    
                } else if equipment == "Water Cooled Split" || equipment == "Water Cooled Packaged" || equipment == "Manual Entry - WC"{
                    // Water Condenser Info
                    base = base_set[3]
                    "WATER COOLED CONDENSER INFO:".draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                    label9.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label10.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label11.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    
                    makeWCC.text?.draw(at: CGPoint(x: 62, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                    modelWCC.text?.draw(at: CGPoint(x: 67, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    serialWCC.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
                
                // Compressor #1 Info
                base = base_set[4]
                label24.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label9.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label10.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label11.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    // Middle
                label16.draw(at: CGPoint(x: 220, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                base += 5
                label26.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label27.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label17.draw(at: CGPoint(x: 25, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])

                    // Middle
                label32.draw(at: CGPoint(x: 220, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label28.draw(at: CGPoint(x: 220, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label18.draw(at: CGPoint(x: 220, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                base = base_set[4]
                makeCompressor1text.text?.draw(at: CGPoint(x: 62, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                modelCompressor1text.text?.draw(at: CGPoint(x: 67, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                serialCompressor1text.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    // Middle
                voltageCompressor1.titleLabel?.text?.draw(at: CGPoint(x: 260, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                base += 5
                refrigerantCompressor1text.text?.draw(at: CGPoint(x: 100, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(highsideCompressor1.text!) PSI".draw(at: CGPoint(x: 82, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                AmpRatingCompressor1.text?.draw(at: CGPoint(x: 100, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                    // Middle
                "\(chargeLbsCompressor1.text!) LBS / \(chargeOzCompressor1.text!) OZ".draw(at: CGPoint(x: 269, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(lowsideCompressor1.text!) PSI".draw(at: CGPoint(x: 275, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                AmpActualCompressor1.text?.draw(at: CGPoint(x: 297, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                if equipment == "Water Cooled Packaged" || equipment == "Water Cooled Split" || equipment == "Manual Entry - WC" {
                    label34.draw(at: CGPoint(x: 25, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label36.draw(at: CGPoint(x: 25, y: base+offset+(height*7)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label35.draw(at: CGPoint(x: 220, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label37.draw(at: CGPoint(x: 220, y: base+offset+(height*7)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    enteringPressureCompressor1.text?.draw(at: CGPoint(x: 135, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    leavingPressureCompressor1.text?.draw(at: CGPoint(x: 128, y: base+offset+(height*7)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(enteringTemperatureCompressor1.text!) °F".draw(at: CGPoint(x: 342, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    "\(leavingTemperatureCompressor1.text!) °F".draw(at: CGPoint(x: 335, y: base+offset+(height*7)), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
               
                // Compressor #2 Info
                base = base_set[5]
                label25.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label9.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label10.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label11.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    // Middle
                label16.draw(at: CGPoint(x: 220, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                base += 5
                label26.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label27.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label17.draw(at: CGPoint(x: 25, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    // Middle
                label32.draw(at: CGPoint(x: 220, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label28.draw(at: CGPoint(x: 220, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label18.draw(at: CGPoint(x: 220, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
            
                base = base_set[5]
                makeCompressor2.text?.draw(at: CGPoint(x: 62, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                modelCompressor2.text?.draw(at: CGPoint(x: 67, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                serialCompressor2.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    // Middle
                voltageCompressor2.titleLabel?.text?.draw(at: CGPoint(x: 260, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                base += 5
                refrigerantCompressor2.text?.draw(at: CGPoint(x: 100, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(highsideCompressor2.text!) PSI".draw(at: CGPoint(x: 82, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                AmpRatingCompressor2.text?.draw(at: CGPoint(x: 100, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                    // Middle
                "\(chargeLbsCompressor2.text!) LBS / \(chargeOzCompressor2.text!) OZ".draw(at: CGPoint(x: 269, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(lowsideCompressor2.text!) PSI".draw(at: CGPoint(x: 275, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                AmpActualCompressor2.text?.draw(at: CGPoint(x: 297, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                        
            }
            else if equipment == "Pump"{
                // Circulating Pump Motor Info
                base = base_set[1]
                label38.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label8.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label9.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label10.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label16.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label17.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label58.draw(at: CGPoint(x: 213, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label18.draw(at: CGPoint(x: 213, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label34.draw(at: CGPoint(x: 25, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label36.draw(at: CGPoint(x: 25, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label35.draw(at: CGPoint(x: 213, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label37.draw(at: CGPoint(x: 213, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label0.draw(at: CGPoint(x: 213, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                equipment.draw(at: CGPoint(x: 305, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                "SYSTEM:".draw(at: CGPoint(x: 420, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                systemPump.titleLabel?.text?.draw(at: CGPoint(x: 468, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitnumberPump.text?.draw(at: CGPoint(x: 63, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                makePump.text?.draw(at: CGPoint(x: 61, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                modelPump.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                voltagePump.titleLabel?.text?.draw(at: CGPoint(x: 64, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                ampRatingPump.text?.draw(at: CGPoint(x: 98, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                enteringPressurePump.text?.draw(at: CGPoint(x: 134, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                leavingPressurePump.text?.draw(at: CGPoint(x: 128, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                    // Middle
                voltageActualPump.text?.draw(at: CGPoint(x: 294, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                ampActualPump.text?.draw(at: CGPoint(x: 290, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(enteringTemperaturePump.text!) °F".draw(at: CGPoint(x: 334, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(leavingTemperaturePump.text!) °F".draw(at: CGPoint(x: 327, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                // Pump Volute Info
                base = base_set[2]
                label55.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label8.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                label9.draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label10.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                "IMPELLER SIZE:".draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                makeVolute.text?.draw(at: CGPoint(x: 61, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                modelVolute.text?.draw(at: CGPoint(x: 61, y: base+offset+height), withAttributes: textFont as [NSAttributedString.Key : Any])
                serialVolute.text?.draw(at: CGPoint(x: 67, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                "\(impellerVolute.text!) INCHES".draw(at: CGPoint(x: 103, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                // CHECKLIST
                base = base_set[3]
                label40.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                label42.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                "PUMP ROTATION CHECKED:".draw(at: CGPoint(x: 25, y: base+offset+(height)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label46.draw(at: CGPoint(x: 25, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label47.draw(at: CGPoint(x: 25, y: base+offset+(height*3)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label56.draw(at: CGPoint(x: 25, y: base+offset+(height*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label48.draw(at: CGPoint(x: 25, y: base+offset+(height*5)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label51.draw(at: CGPoint(x: 25, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                let BMS = isBMS.titleLabel?.text
                leakDetectionTest.titleLabel?.text?.draw(at: CGPoint(x: 270, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitPitchedTowards.titleLabel?.text?.draw(at: CGPoint(x: 159, y: base+offset+(height)), withAttributes: textFont as [NSAttributedString.Key : Any])
                BMS?.draw(at: CGPoint(x: 109, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                strainersCracked.titleLabel?.text?.draw(at: CGPoint(x: 211, y: base+offset+(height*3)), withAttributes: textFont as [NSAttributedString.Key : Any])
                thermostatgauge.titleLabel?.text?.draw(at: CGPoint(x: 283, y: base+offset+(height*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                pipeLabeling.titleLabel?.text?.draw(at: CGPoint(x: 132, y: base+offset+(height*5)), withAttributes: textFont as [NSAttributedString.Key : Any])
                ladderbutton.titleLabel?.text?.draw(at: CGPoint(x: 70, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                if BMS == "Yes"{
                    "BMS VENDOR:".draw(at: CGPoint(x: 396, y: base+offset+(height*2)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    BMSvendortext.text?.draw(at: CGPoint(x: 466, y: base+offset+(height*2)), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
                
                // NOTES
                base = base_set[4]
                label52.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .natural
                paragraphStyle.lineBreakMode = .byWordWrapping
                // 3
                let textFontpar = [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
                ]
                let notes_text = NSAttributedString(string: NotesText.text, attributes: textFontpar)

                notes_text.draw(in: CGRect(x: 25, y: base+15, width: Int(pageRect.width) - 50,height: 150))
                               
            }
            
            // 2
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byWordWrapping
            // 3
            var textFontpar = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
            ]
            
            var page = NSAttributedString(string: "Page 1", attributes: textFont)
            let pageSize = page.size()
            let Rect = CGRect(x: (pageRect.width - pageSize.width) / 2.0,y: 750, width: pageSize.width,height: pageSize.height)
            page.draw(in: Rect)
        
            if equipment != "Pump"{
                context.beginPage()
                
                // Create Filled Color Rects
                if let graphic_context = UIGraphicsGetCurrentContext(){
                    var rect = CGRect(x: 0, y: 0, width: 612, height: 792)
                    graphic_context.setFillColor(UIColor(red:241/255, green:243/255, blue:244/255, alpha: 1).cgColor)
                    graphic_context.fill(rect)
                    graphic_context.setFillColor(UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor)
                    rect = CGRect(x: 20, y: base_set[6], width: 572, height: 13)
                    graphic_context.fill(rect)
                    rect = CGRect(x: 20, y: base_set[7], width: 572, height: 13)
                    graphic_context.fill(rect)
                }
                // 5
                self.logo_image?.draw(in: imageRect)
                attributedTitle.draw(in: titleStringRect)
                attributes = [NSAttributedString.Key.font: UIFont(name:"SerifGothicRegular",size: 8)]
                address1.draw(at: CGPoint(x: 470, y: 23), withAttributes: attributes as [NSAttributedString.Key : Any])
                address2.draw(at: CGPoint(x: 470, y: 33), withAttributes: attributes as [NSAttributedString.Key : Any])
                address3.draw(at: CGPoint(x: 470, y: 43), withAttributes: attributes as [NSAttributedString.Key : Any])
                address4.draw(at: CGPoint(x: 470, y: 53), withAttributes: attributes as [NSAttributedString.Key : Any])
                attributes = [NSAttributedString.Key.font: UIFont(name:"Roboto-Bold",size: 10)]
                // CHECKLIST
                base = base_set[6]; var shift = height
                if equipment == "Water Cooled Packaged" || equipment == "Water Cooled Split" || equipment == "Manual Entry - WC"{
                    label41.draw(at: CGPoint(x: 25, y: base+offset), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label47.draw(at: CGPoint(x: 25, y: base+offset+(height*6)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label56.draw(at: CGPoint(x: 25, y: base+offset+(height*7)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label57.draw(at: CGPoint(x: 25, y: base+offset+(height*8)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    waterRegValve.titleLabel?.text?.draw(at: CGPoint(x: 120, y: base+offset), withAttributes: textFont as [NSAttributedString.Key : Any])
                    strainersCracked.titleLabel?.text?.draw(at: CGPoint(x: 210, y: base+offset+(height*6)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    thermostatgauge.titleLabel?.text?.draw(at: CGPoint(x: 283, y: base+offset+(height*7)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    autoisolationvalve.titleLabel?.text?.draw(at: CGPoint(x: 281, y: base+offset+(height*8)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    shift = 0
                }
                label40.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                
                label42.draw(at: CGPoint(x: 25, y: base+offset+(height)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])
                label43.draw(at: CGPoint(x: 25, y: base+offset+(height*2)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])
                label44.draw(at: CGPoint(x: 25, y: base+offset+(height*3)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])
                label45.draw(at: CGPoint(x: 25, y: base+offset+(height*4)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])
                label46.draw(at: CGPoint(x: 25, y: base+offset+(height*5)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])

                label48.draw(at: CGPoint(x: 25, y: base+offset+(height*9)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label49.draw(at: CGPoint(x: 25, y: base+offset+(height*10)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                label51.draw(at: CGPoint(x: 25, y: base+offset+(height*11)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                
                let BMS = isBMS.titleLabel?.text
                let humidifer = humidifierbutton.titleLabel?.text
                leakDetectionTest.titleLabel?.text?.draw(at: CGPoint(x: 271, y: base+offset+(height)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                unitPitchedTowards.titleLabel?.text?.draw(at: CGPoint(x: 193, y: base+offset+(height*2)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                drainLine.titleLabel?.text?.draw(at: CGPoint(x: 203, y: base+offset+(height*3)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                condensatePumpTest.titleLabel?.text?.draw(at: CGPoint(x: 284, y: base+offset+(height*4)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                BMS?.draw(at: CGPoint(x: 109, y: base+offset+(height*5)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                pipeLabeling.titleLabel?.text?.draw(at: CGPoint(x: 132, y: base+offset+(height*9)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                humidifer?.draw(at: CGPoint(x: 85, y: base+offset+(height*10)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                ladderbutton.titleLabel?.text?.draw(at: CGPoint(x: 70, y: base+offset+(height*11)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                
                if BMS == "Yes"{
                    "BMS VENDOR:".draw(at: CGPoint(x: 396, y: base+offset+(height*5)-shift), withAttributes: attributes as [NSAttributedString.Key : Any])
                    BMSvendortext.text?.draw(at: CGPoint(x: 466, y: base+offset+(height*5)-shift), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
                
                if humidifer == "Yes"{
                    label10.draw(at: CGPoint(x: 242, y: base+offset+(height*10)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label11.draw(at: CGPoint(x: 413, y: base+offset+(height*10)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    label50.draw(at: CGPoint(x: 418, y: base+offset+(height*11)-(shift*4)), withAttributes: attributes as [NSAttributedString.Key : Any])
                    
                    modelHumidifier.text?.draw(at: CGPoint(x: 284, y: base+offset+(height*10)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    serialHumidifer.text?.draw(at: CGPoint(x: 457, y: base+offset+(height*10)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                    ampsHumidifer.text?.draw(at: CGPoint(x: 457, y: base+offset+(height*11)-(shift*4)), withAttributes: textFont as [NSAttributedString.Key : Any])
                }
                
                // NOTES
                base = base_set[7]
                label52.draw(at: CGPoint(x: 25, y: base), withAttributes: attributes_white as [NSAttributedString.Key : Any])
                
                paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .natural
                paragraphStyle.lineBreakMode = .byWordWrapping
                // 3
                textFontpar = [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10.0)
                ]
                let notes_text = NSAttributedString(string: NotesText.text, attributes: textFontpar)

                notes_text.draw(in: CGRect(x: 25, y: base+15, width: Int(pageRect.width) - 50,height: 150))
                
                page = NSAttributedString(string: "Page 2", attributes: textFont)
                page.draw(in: Rect)
            }
        }
        return data
    }
    
    @IBAction func SendEmailClick(_ sender: Any) {
        if confirmInformationSubmitted(){
            self.data = self.createFlyer()
            //performSegue(withIdentifier: "pdfPreview", sender: self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date_input = dateFormatter.string(from: datepicker.date)
            let customer = SelectJobNamelabel.text!
            let floor = floortext.text!
            var equipment_type = SelectEquipmentbutton.titleLabel!.text!
            if equipment_type == "Manual Entry - WC" || equipment_type == "Manual Entry - AC" {equipment_type = EquipmentText.text!}
            var unit_number = ""
            if equipment_type != "Pump"{
                unit_number = unitnumbertext.text!}
            else {unit_number = unitnumberPump.text!}
            if unit_number != "" {unit_number += " "}
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["dispatch@pierpontmech.com"])
                mail.setSubject("\(unit_number)Start Up Sheet_\(customer)_\(date_input)")
                mail.setMessageBody("Dear PIERPONT MECH DISPATCH,<br><br>The \(equipment_type), Unit# \(unit_number)has been started up for \(customer) FLOOR \(floor) on \(date_input). This is an automated receipt for start up sheet submission.<br><br>Thanks,", isHTML: true)
                mail.addAttachmentData(self.data, mimeType: "application/pdf", fileName: "\(unit_number)Start Up Sheet_\(customer)_\(date_input).pdf")
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
       
        if SelectJobNamelabel?.text == "SELECT JOB NAME" {
            error_count += 1
            error_string += "\n\(error_count). JOB NAME"
        }
        
        if SelectMainMechaniclabel.text == "SELECT MECHANIC" {
            error_count += 1
            error_string += "\n\(error_count). MECHANIC NAME"
        }
        
        if SelectEquipmentbutton.currentTitle == "Select Equipment" {
            error_count += 1
            error_string += "\n\(error_count). EQUIPMENT TYPE"
        }
        
        if error_string == "" {return true}
        let alert = UIAlertController(title: "Please Provide the Following:",
            message: "\(error_string)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "pdfPreview" {
        guard let vc = segue.destination as? ViewControllerTemp else { return }
            vc.documentData = self.data
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result == MFMailComposeResult.sent {
            self.email_sent = 1
            _ = navigationController?.popViewController(animated: true)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {return Customer_Data.count}
        else {
            return Mechanic_Names.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x:0,y:0,width: 760, height: 35))
        if pickerView.tag == 1 {label.text = Customer_Data[row].uppercased()}
        else {label.text = Mechanic_Names[row].uppercased()}
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
}
