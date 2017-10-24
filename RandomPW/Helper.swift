import Cocoa

let ad = NSApplication.shared.delegate as! AppDelegate
let mwc = ad.mainWindowController!

func getRandomBytes(count: Int) -> [UInt8] {
    var buffer = [UInt8](repeating: 0, count: count)
    _ = SecRandomCopyBytes(
        kSecRandomDefault, count, &buffer)
    return buffer
}

func helperGetHex(_ n: Int = 16) -> String {
    let sep: String = ""
    let L: [UInt8] = getRandomBytes(count: n)
    return L.map{ String(format: "%02x", $0) }.joined(separator: sep)
}

func helperDoIt() -> String {
    let n: Int = mwc.lengthTextField.integerValue
    
    let hex: Bool = (mwc.hexCheckbox.state == NSControl.StateValue.on)
    if hex { return helperGetHex(n/2) }
    
    let useDigits: Bool = (mwc.digitsCheckbox.state == NSControl.StateValue.on)
    let useUC: Bool = (mwc.ucCheckbox.state == NSControl.StateValue.on)
    let useLC: Bool = (mwc.lcCheckbox.state == NSControl.StateValue.on)

    var s = ""
    if useLC     { s = "abcdefghijklmnopqrstuvwxyz" }
    if useUC     { s += "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    if useDigits { s += "0123456789" }
    
    let t = mwc.characterTextField.stringValue
    Swift.print("t: \(t)")
    if t.count != 0 { s = t }
    
    let i = s.startIndex
    let m = UInt8(s.count)
    var L: [Character] = []
    
    for b in getRandomBytes(count: n) {
        let j = s.index(i, offsetBy: Int(b % m))
        L.append(s[j])
    }
    
    //Swift.print("n: \(n), dg: \(useDigits), uc: \(useUC)")
    return String(L)
}
