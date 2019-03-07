import UIKit

class ViewController: UIViewController
{
    
    var jsonObjects = [JSONObject]()
    var myTableView: UITableView!
    var givenURL: URL?
    var parentURL: URL?
    var parentFolder: String?
    var parentType: String?
    var jsonparser: JSONParser!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = parentFolder ?? "TuneIn"
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        // Parse JSON
        if parentFolder == nil
        {
            jsonparser = JSONParser()
            jsonObjects = jsonparser.parseJSON()
        }
        else if parentFolder == "Local Radio"
        {
            jsonparser = JSONParser(givenURL: givenURL!)
            jsonObjects = jsonparser.parseJSONLocalRadio()
        }
        else
        {
            if parentType == "link"
            {
                jsonparser = JSONParser(givenURL: givenURL!)
                jsonObjects = jsonparser.parseJSON()
            }
            else if parentType == ""
            {
                let urlRequest = URLRequest(url: parentURL!)
                let dataRequester = DataRequester()
                let data = dataRequester.makeRequest(request: urlRequest, onSuccess: {(Data) in
                    
                }, onFailure: (Error) in
                    print("Error")
                )
            }
            
//                jsonparser = JSONParser(givenURL: parentURL!)
//                jsonparser = JSONParser(data: data)
                jsonObjects = jsonparser.parseJSONWithChildren()
        }
        
        
        
        
        
        // Refresh Table View
        self.myTableView.reloadData()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: false)
        
        // Get URL and text of the selected row
        let selectedJSONObject = jsonObjects[indexPath.row]
        let newURLString = selectedJSONObject.url
        let newURLStringAsJSON = newURLString + "&render=json"
        let newURL = URL(string: newURLString)
        let newURLAsJSON = URL(string: newURLStringAsJSON)
        let titleText = selectedJSONObject.text
        let type = selectedJSONObject.type
    
        if type == "audio"
        {
            let alert = UIAlertController(title: "This will open the audio in Safari", message: "Do you wish to proceed?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                UIApplication.shared.open(newURL!, options: [:], completionHandler: {(status) in
                    
                })
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            
            return
        }
        
        // Create and present new ViewController with the given URL
        let destinationVC = ViewController()
        destinationVC.givenURL = newURLAsJSON
        destinationVC.parentFolder = titleText
        destinationVC.parentType = type
        destinationVC.parentURL = self.givenURL
        
        self.navigationController?.pushViewController(destinationVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(jsonObjects[indexPath.row].text)"
        
        return cell
    }
}
