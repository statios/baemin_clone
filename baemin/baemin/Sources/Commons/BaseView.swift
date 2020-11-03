//
//  BaseView.swift
//  baemin
//
//  Created by Stat.So on 2020/11/03.
//

import Foundation
import UIKit
import RxSwift

@objc protocol View {
  @objc func setupUI()
  @objc func setupBinding()
}

class BaseView: UIView, View {
  
  var disposeBag = DisposeBag()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func setupUI() {
    
  }
  
  @objc dynamic func setupBinding() {
    
  }
}
