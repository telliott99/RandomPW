import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var digitsCheckbox: NSButton!
    @IBOutlet weak var ucCheckbox: NSButton!
    @IBOutlet weak var lengthTextField: NSTextField!
    @IBOutlet weak var pwTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        lengthTextField.doubleValue = 40
        ucCheckbox.state = NSControl.StateValue.off
        digitsCheckbox.state = NSControl.StateValue.off
    }
    
    @IBAction func button_pushed(sender: AnyObject) {
        Swift.print("MWC:  button_pushed")
        let result: String = helperDoIt()
        Swift.print(result)
        pwTextField.stringValue = result
    }
}
