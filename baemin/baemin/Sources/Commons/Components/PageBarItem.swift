//
//  PageBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

class PageBarItem: UIView {
  
  var titleLabel: UILabel!
  
  init(title: String?) {
    super.init(frame: .zero)
    titleLabel = UILabel().asChainable()
      .text(title)
      .textAlignment(.center)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }.origin
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
