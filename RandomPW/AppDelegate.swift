import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.close()  // default app window
        let mwc = MainWindowController(windowNibName: "MainWindowController")
        mwc.showWindow(self)
        // mwc.button_pushed(sender: self)  // display pw on launch
        self.mainWindowController = mwc
    }
}
