import Cocoa

let ad = NSApplication.shared.delegate as! AppDelegate
let mwc = ad.mainWindowController!

func getRandomBytes(count: Int) -> [UInt8] {
    var buffer = [UInt8](repeating: 0, count: count)
    _ = SecRandomCopyBytes(
        kSecRandomDefault, count, &buffer)
    return buffer
}

func helperDoIt() -> String {
    let useDigits: Bool = (mwc.digitsCheckbox.state == NSControl.StateValue.on)
    let useUC: Bool = (mwc.ucCheckbox.state == NSControl.StateValue.on)
    
    var s = "abcdefghijklmnopqrstuvwxyz"
    if useUC     { s += "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    if useDigits { s += "0123456789" }
    let i = s.startIndex
    let m = UInt8(s.count)
    
    var L: [Character] = []
    let n: Int = mwc.lengthTextField.integerValue
    for b in getRandomBytes(count: n) {
        let j = s.index(i, offsetBy: Int(b % m))
        L.append(s[j])
    }
    
    //Swift.print("n: \(n), dg: \(useDigits), uc: \(useUC)")
    return String(L)
}
