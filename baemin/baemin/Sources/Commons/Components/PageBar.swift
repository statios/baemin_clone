//
//  PageBar.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

class PageBar: UIView {
  
  // selectedBar, font color
  var barTintColor: UIColor?
  var unselectedItemTintColor: UIColor? //
  
  var selectedBarView: UIView!
  var contentView: UIStackView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView = UIStackView().asChainable()
      .background(color: .systemTeal)
      .axis(.horizontal)
      .distribution(.fillEqually)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }.origin
    
    pageBar.addArrangedSubview(PageBarItem(title: "Hello"))
    pageBar.addArrangedSubview(PageBarItem(title: "gohyunsil"))
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
