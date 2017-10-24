import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var digitsCheckbox: NSButton!
    @IBOutlet weak var lcCheckbox: NSButton!
    @IBOutlet weak var ucCheckbox: NSButton!
    @IBOutlet weak var hexCheckbox: NSButton!
    
    @IBOutlet weak var lengthTextField: NSTextField!
    @IBOutlet weak var pwTextField: NSTextField!
    @IBOutlet weak var characterTextField: NSTextField!
    
    let OFF = NSControl.StateValue.off
    let ON = NSControl.StateValue.on
    
    override func windowDidLoad() {
        super.windowDidLoad()
        lengthTextField.doubleValue = 40
        
        lcCheckbox.state = ON
        ucCheckbox.state = OFF
        digitsCheckbox.state = OFF
        hexCheckbox.state = OFF
        
        characterTextField.stringValue = ""
        
        // to deselect pw window
        let textEditor = window!.fieldEditor(true, for: pwTextField)!
        let range = NSRange(0..<0)
        textEditor.selectedRange = range
    }
        
    @IBAction func hex_selected(sender: AnyObject) {
        lcCheckbox.state = OFF
        ucCheckbox.state = OFF
        digitsCheckbox.state = OFF
        characterTextField.stringValue = ""
    }
    
    @IBAction func other_selected(sender: AnyObject) {
        hexCheckbox.state = OFF
        characterTextField.stringValue = ""
    }
    
    @IBAction func charTFEdited(sender: AnyObject) {
        if characterTextField.stringValue.count == 0 {
            _ = runAlert("Custom character set needed!")
        }
        else {
            lcCheckbox.state = OFF
            ucCheckbox.state = OFF
            digitsCheckbox.state = OFF
            hexCheckbox.state = OFF
            doIt()
        }
    }

    @IBAction func button_pushed(sender: AnyObject) {
        Swift.print("MWC:  button pushed")
        characterTextField.stringValue = ""
        doIt()
    }

    func doIt() {
        let result: String = helperDoIt()
        Swift.print(result)
        pwTextField.stringValue = result
    }
}

