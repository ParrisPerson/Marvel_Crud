//
//  ViewController.swift
//  CruzDemo
//
//  Created by Parris Person on 7/11/21.
//


import UIKit
import SDWebImage

 class tableCell: UITableViewCell {
 
     let title: UILabel = {
         let label = UILabel(frame: .zero)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .left
         label.textColor = .black
         return label
     }()
  
    let image : UIImageView = {
        let v = UIImageView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 15
        v.backgroundColor = .gray
        return v
    }()
 
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.backgroundColor = .clear
 
         self.addSubviews(title, image)
  
         setupConstraints()
  
     }

     required init(coder aDecoder: NSCoder) {
         
         fatalError("init(coder:) has not been implemented")
     }
     
     func setupConstraints() {
         
         NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0)
         ])
        
        NSLayoutConstraint.activate([
           image.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            image.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 70)
        ])
 
  
     }

     override func layoutSubviews() {
         super.layoutSubviews()
     }
  
 }
 
class MainView: BaseView{
    
    var presenter: MainPresenterProtocol?
    
    let usersTableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.register(tableCell.self, forCellReuseIdentifier: "tableCell")
        v.tableFooterView = UIView(frame: .zero)
        v.separatorStyle = .none;
        v.bounces = false
        return v
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .mainWhite
        view.addSubviews(usersTableView)
        self.navigationController?.navigationBar.isHidden = false
        showTitle()
        title = "Marvel Characters List"
        
        
        setupConstraints()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        if presenter != nil{
            self.presenter?.viewDidLoad()
        }
        
        
        
        //add.addTarget(self, action: #selector(touchAddButton), for: .touchUpInside)
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  self.presenter?.viewDidLoad()
    }
    
    
    
   
    
    
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            usersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            usersTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            usersTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        
       
    }
    
    
}

 
 extension MainView: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return presenter!.getHeroes().count
      
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let user = presenter!.getHeroes()[indexPath.row]
         cell.title.text = user.name
        cell.image.sd_setImage(with: URL(string: String(format: "%@.%@", user.thumbnail!.path!, user.thumbnail!.extension!)), completed: nil)
        

        
        return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 100
        return CGFloat(height)
     }
 }

 extension MainView: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = presenter!.getHeroes()[indexPath.row]
        presenter?.goDetail(superH: user)
     }
 }

extension MainView: MainViewProtocol {

    func reloadTable() {
        usersTableView.reloadData()
    }
}
