//
//  SBView.swift
//  iOSStoryBook
//
//  Created by Jayakrishnan u on 9/3/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import UIKit

@IBDesignable public class SBView: UIView {
    
    @IBInspectable public var viewBackgroundColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
  lazy var addButton: UIButton = {
    let addButton = UIButton(type: .contactAdd)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    return addButton
  }()
  
  lazy var contentView: UIImageView = {
    let contentView = UIImageView()
    contentView.image = UIImage(color: .clear)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    return contentView
  }()
  
  lazy var headerTitle: UILabel = {
    let headerTitle = UILabel()
    headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .medium)
    headerTitle.text = "Custom View"
    headerTitle.textAlignment = .center
    headerTitle.translatesAutoresizingMaskIntoConstraints = false
    return headerTitle
  }()
  
  lazy var headerView: UIView = {
    let headerView = UIView()
    headerView.backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 0.5)
    headerView.layer.shadowColor = UIColor.gray.cgColor
    headerView.layer.shadowOffset = CGSize(width: 0, height: 10)
    headerView.layer.shadowOpacity = 1
    headerView.layer.shadowRadius = 5
    headerView.addSubview(headerTitle)
    headerView.addSubview(addButton)
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = viewBackgroundColor
    addSubview(contentView)
    addSubview(headerView)
    setupLayout()
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      //pin headerTitle to headerView
      headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor),
      headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
      headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
      headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
      
      //layout addButton in headerView
      addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
      addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
      
      //pin headerView to top
      headerView.topAnchor.constraint(equalTo: topAnchor),
      headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 40),
      
      //layout contentView
      contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  

    public override class var requiresConstraintBasedLayout: Bool {
    return true
  }
    
}

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
