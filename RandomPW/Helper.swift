import Cocoa

let ad = NSApplication.shared.delegate as! AppDelegate
let mwc = ad.mainWindowController!

func getRandomBytes(count: Int) -> [UInt8] {
    var buffer = [UInt8](repeating: 0, count: count)
    _ = SecRandomCopyBytes(
        kSecRandomDefault, count, &buffer)
    return buffer
}

func helperGetHex() -> String {
    let n: Int = mwc.lengthTextField.integerValue
    let sep: String = ""
    
    let L: [UInt8] = getRandomBytes(count: n)
    return L.map{ String(format: "%02x", $0) }.joined(separator: sep)
}

func helperDoIt() -> String {
    mwc.getCheckboxesFromUI()
    Swift.print("dict:  \(mwc.checkboxDict)")
    
    let n: Int = mwc.lengthTextField.integerValue
    
    let hex: Bool = mwc.checkboxDict["hex"]!
    if hex { return helperGetHex() }
    
    let useDigits: Bool = mwc.checkboxDict["dg"]!
    let useUC: Bool = mwc.checkboxDict["uc"]!
    let useLC: Bool = mwc.checkboxDict["lc"]!
    
    var s = ""
    if useLC  { s = "abcdefghijklmnopqrstuvwxyz" }
    if useUC  { s += "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    if useDigits { s += "0123456789" }
    
    let b58: Bool = mwc.checkboxDict["b58"]!
    if b58 {
       s =  "abcdefghijkmnopqrstuvwxyz"
       s += "ABCDEFGHJKLMNPQRSTUVWXYZ123456789"
    }

    let t = mwc.characterTextField.stringValue
    Swift.print("t: \(t)")
    if t.count != 0 { s = t }
    
    let i = s.startIndex
    let m = UInt8(s.count)
    var L: [Character] = []
    
    for b in getRandomBytes(count: n) {
        // got m == 0 here once
        if m == 0 {
            Swift.print("got bad length for s")
            return ""
        }
        let j = s.index(i, offsetBy: Int(b % m))
        L.append(s[j])
    }
    
    //Swift.print("n: \(n), dg: \(useDigits), uc: \(useUC)")
    return String(L)
}
