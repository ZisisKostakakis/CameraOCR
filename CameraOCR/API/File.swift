//import Foundation
//
//func testing22() {
//        let parameters:Dictionary<String, Any> = [
//            "text" : "Some text"
//        ]
//        as [String: Any]
//        let newValue = [parameters]
//    guard let postData = try? JSONSerialization.data(withJSONObject: newValue, options: []) else {
//        return
//    }
//    let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:12345/predict")! as URL,
//                                      cachePolicy: .useProtocolCachePolicy,
//                                      timeoutInterval: 10.0)
//    request.httpMethod = "POST"
//    request.httpBody = postData as Data
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        if (error != nil) {
//            print(error as Any)
//        } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse as Any)
//                if let data = data, let string = String(data: data, encoding: .utf8) {
//                    print("Content: \(string)")
//            }
//        }
//    })
//    
//    dataTask.resume()
//}
