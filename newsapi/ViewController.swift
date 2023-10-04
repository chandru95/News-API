//
//  ViewController.swift
//  newsapi
//
//  Created by Admin on 29/09/23.
//

import UIKit
import SDWebImage

struct newresponse: Codable {
    let articles: [articles]
}
struct articles: Codable{
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    var json: newresponse?
    var selectedURL: String?
    
    func getdata(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=72abd87555b541328d0cfefa263f33c5")
        let task = URLSession.shared.dataTask(with: url!){
            (data,reponse,error) in
            do{
                let content = try? JSONDecoder().decode(newresponse.self, from: data!)
                self.json = content!
                //print(content)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
    
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableViewCell
        let data = json?.articles[indexPath.row]
        cell.title.text = data?.title
        cell.label2.text = data?.description
        cell.urllabel.text = data?.url
        cell.published.text = data?.publishedAt?.description
        if let imgg = data?.urlToImage,
           let imageurl = URL(string: imgg) {
            cell.imageview.sd_setImage(with: imageurl, placeholderImage: UIImage(named: "img1")) { (imageurl, error, cachetype, imgg) in
                if let error = error{
                    print("error loading image:\(error.localizedDescription)")
                }
                
            }
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
            selectedURL = cell.urllabel.text
            performSegue(withIdentifier: "WebViewSegue", sender: self)
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewSegue" {
            if let secondViewController = segue.destination as? secondViewController {
                secondViewController.urlString = selectedURL
            }
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}


