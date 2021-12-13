
import Foundation
import CoreMedia

struct values{
    static var useToDo = false
    static var recipient:String = ""
    static var context:String = ""
    static var sentence:String = ""
    static var linese:Array<String.SubSequence> = Array()
}
struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
        // content is variable that is storing the string text
        let emailStrings:[String] = extractEmailAddrIn(text: content)
        values.context = content
        if !emailStrings.isEmpty{
            
            values.recipient = emailStrings[0]
        } else {
            //if email string is empty then
            values.useToDo = true
            values.sentence = values.context
            let lines = values.sentence.split(whereSeparator: \.isNewline)
            //print(lines)
            
            values.linese = lines
//            print(values.linese)
            print("chilling")
        }
        print(content)
        func extractEmailAddrIn(text: String) -> [String] {
            var results = [String]()
            
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            let nsText = text as NSString
            do {
                let regExp = try NSRegularExpression(pattern: emailRegex, options: .caseInsensitive)
                let range = NSMakeRange(0, text.count)
                let matches = regExp.matches(in: text, options: .reportProgress, range: range)
                
                for match in matches {
                    let matchRange = match.range
                    results.append(nsText.substring(with: matchRange))
                }
            } catch (let error) {
                print(error)
            }
            
            return results
        }
    }
}
