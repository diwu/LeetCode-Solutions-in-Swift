/* In playground 
   author: Dima Pilipenko aka dimpiax
   date: 10/29/2015
*/

func countAndSay(value: Int) -> String {
    let chars = String(value).characters.map { $0 }
    
    var result = ""
    var repeatCount = 0
    for (index, char) in chars.enumerate() {
        repeatCount++
        
        if index > 0 {
            let c = chars[index-1]
            if c != char {
                result += "\(repeatCount-1)\(c)"
                repeatCount = 1
            }
        }
        
        if index == chars.count-1 {
            result += "\(repeatCount)\(char)"
        }
    }
    
    return result
}

countAndSay(153442145511)
    
