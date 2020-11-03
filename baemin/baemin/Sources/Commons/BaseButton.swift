//
//  BaseButton.swift
//  baemin
//
//  Created by Stat.So on 2020/11/03.
//

import UIKit

class BaseButton: UIButton, View {
  
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
