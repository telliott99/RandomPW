import Cocoa

func runAlert(_ s: String, style: NSAlert.Style = .warning) -> Bool {
    let a: NSAlert = NSAlert()
    // Swift.print(a.window.frame.origin)
    
    a.messageText = s
    //a.informativeText = text
    
    a.alertStyle = style
    a.addButton(withTitle: "OK")
    //a.addButtonWithTitle("Cancel")
    
    let result = a.runModal()
    if result == NSApplication.ModalResponse.alertFirstButtonReturn {
        return true
    }
    return false
}
