    

// Helper
extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

// O (N)
func convert(s: String, nRows: Int) -> String {
    var arr = Array<String>(count: nRows, repeatedValue: String())
    var i = 0, len = count(s)
    while i < len {
        for var index = 0; index < nRows && i < len; index++ {
            arr[index].append(s[i++])
        }
        for var index = nRows - 2; index > 0 && i < len; index-- {
            arr[index].append(s[i++])
        }
    }
    var res = String()
    for i in 0..<nRows {
        res.extend(arr[i])
    }
    return res
}

convert("PAYPALISHIRING", 3)
