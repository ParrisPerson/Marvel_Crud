//
//  ViewController.swift
//  CruzDemo
//
//  Created by Parris Person on 7/11/21.
//


import UIKit
import SDWebImage

class DetailView: BaseView{
    
    var presenter: DetailPresenterProtocol?
     
    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
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
    
    let desc: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .mainWhite
        view.addSubviews(name, image, desc )
        self.navigationController?.navigationBar.isHidden = false
        showTitle()
        title = "Detail"
        
        
        setupConstraints()
        
        if presenter != nil{
            self.presenter?.viewDidLoad()
        }
        
        name.text = self.presenter?.getHero().name
        image.sd_setImage(with: URL(string: String(format: "%@.%@", self.presenter!.getHero().thumbnail!.path!, self.presenter!.getHero().thumbnail!.extension!)), completed: nil)
        desc.text = self.presenter?.getHero().description == "" ? "No description" : self.presenter?.getHero().description
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidLoad()
    }
 
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            image.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            name.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            name.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            desc.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            desc.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
 
    }
    
    
}

  
extension DetailView: DetailViewProtocol {

    func reloadTable() {
        
    }
}
