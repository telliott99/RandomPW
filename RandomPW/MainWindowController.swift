import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var digitsCheckbox: NSButton!
    @IBOutlet weak var ucCheckbox: NSButton!
    @IBOutlet weak var hexCheckbox: NSButton!
    
    @IBOutlet weak var lengthTextField: NSTextField!
    @IBOutlet weak var pwTextField: NSTextField!
    @IBOutlet weak var characterTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        lengthTextField.doubleValue = 40
        
        ucCheckbox.state = NSControl.StateValue.off
        digitsCheckbox.state = NSControl.StateValue.off
        hexCheckbox.state = NSControl.StateValue.off
        characterTextField.stringValue = ""
    }
    
    @IBAction func hex_selected(sender: AnyObject) {
        ucCheckbox.state = NSControl.StateValue.off
        digitsCheckbox.state = NSControl.StateValue.off
    }
    
    @IBAction func other_selected(sender: AnyObject) {
        hexCheckbox.state = NSControl.StateValue.off
    }
    
    @IBAction func charTFEdited(sender: AnyObject) {
        // Swift.print("charTFEdited")
        ucCheckbox.state = NSControl.StateValue.off
        digitsCheckbox.state = NSControl.StateValue.off
    }

    @IBAction func button_pushed(sender: AnyObject) {
        Swift.print("MWC:  button pushed")
        let result: String = helperDoIt()
        Swift.print(result)
        pwTextField.stringValue = result
    }
}
