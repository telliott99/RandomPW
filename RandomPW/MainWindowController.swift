import Cocoa

class MainWindowController: NSWindowController {
    /*
    Should really use bindings
    UI checkboxes <=> dict
    But I've forgotten how at the moment
    */
    var checkboxDict = [String: Bool]()

    @IBOutlet weak var digitsCheckbox: NSButton!
    @IBOutlet weak var lcCheckbox: NSButton!
    @IBOutlet weak var ucCheckbox: NSButton!
    @IBOutlet weak var hexCheckbox: NSButton!
    @IBOutlet weak var b58Checkbox: NSButton!
    
    let OFF = NSControl.StateValue.off
    let ON = NSControl.StateValue.on
    
    @IBOutlet weak var lengthTextField: NSTextField!
    @IBOutlet weak var pwTextField: NSTextField!
    @IBOutlet weak var characterTextField: NSTextField!

    override func windowDidLoad() {
        super.windowDidLoad()
        lengthTextField.doubleValue = 50
        
        checkboxDict["lc"] = false
        checkboxDict["uc"] = false
        checkboxDict["dg"] = false
        checkboxDict["hex"] = false
        checkboxDict["b58"] = true
        setCheckboxes()

        characterTextField.stringValue = ""
        pwTextField.stringValue = "xxx...................."
        
        // doIt()  // causes error!
    }
    
    func setCheckboxes() {
        let L1 = ["lc","uc","dg","hex","b58"]
        let L2 = [lcCheckbox, ucCheckbox,
                  digitsCheckbox, hexCheckbox,
                  b58Checkbox]
        for (s,box) in zip(L1,L2) {
            if checkboxDict[s]! {
                box!.state = ON
            }
            else {
                box!.state = OFF
            }
        }
        
    }
        
    @IBAction func hex_selected(sender: AnyObject) {
        // only hex can be selected, other checkboxes unset
        
        checkboxDict["lc"] = false
        checkboxDict["uc"] = false
        checkboxDict["dg"] = false
        checkboxDict["hex"] = true
        checkboxDict["b58"] = false
        setCheckboxes()
        characterTextField.stringValue = ""
    }
    
    @IBAction func b58_selected(sender: AnyObject) {
        // only b58 can be selected, other checkboxes unset
    
        checkboxDict["lc"] = false
        checkboxDict["uc"] = false
        checkboxDict["dg"] = false
        checkboxDict["hex"] = false
        checkboxDict["b58"] = true
        setCheckboxes()
        characterTextField.stringValue = ""
    }

    @IBAction func other_selected(sender: AnyObject) {
        hexCheckbox.state = OFF
        b58Checkbox.state = OFF
        // checkboxDict["b58"] = false
        characterTextField.stringValue = ""
    }
    
    @IBAction func charTFEdited(sender: AnyObject) {
        if characterTextField.stringValue.count == 0 {
            _ = runAlert("Custom character set needed!")
        }
        else {
            checkboxDict["lc"] = false
            checkboxDict["uc"] = false
            checkboxDict["dg"] = false
            checkboxDict["hex"] = false
            checkboxDict["b58"] = false
            setCheckboxes()
            doIt()
        }
    }
    
    func getCheckboxesFromUI() {
        checkboxDict["lc"] = lcCheckbox.state == ON
        checkboxDict["uc"] = ucCheckbox.state == ON
        checkboxDict["dg"] = digitsCheckbox.state == ON
        checkboxDict["hex"] = hexCheckbox.state == ON
        checkboxDict["b58"] = b58Checkbox.state == ON
    }

    @IBAction func button_pushed(sender: AnyObject) {
        Swift.print("MWC:  button pushed")
        characterTextField.stringValue = ""
        doIt()
    }

    func doIt() {
        let result: String = helperDoIt()
        // Swift.print(result)
        pwTextField.stringValue = result
    }
}

