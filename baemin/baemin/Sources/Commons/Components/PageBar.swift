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
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setPageBarItems(_ viewControllers: [UIViewController]) {
    viewControllers
      .map { PageBarItem(title: $0.title) }
      .forEach { contentView.addArrangedSubview($0) }
  }
}
