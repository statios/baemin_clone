//
//  UICollectionView+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/12.
//

import UIKit

extension Chain where Origin: UICollectionView {
  @discardableResult
  func register(_ cellClass: UICollectionViewCell.Type) -> Chain {
    self.origin.register(cellClass,
                         forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    return self
  }
  @discardableResult
  func isPagingEnabled(_ canPaging: Bool) -> Chain {
    self.origin.isPagingEnabled = canPaging
    return self
  }
  @discardableResult
  func showsHorizontalScrollIndicator(_ show: Bool) -> Chain {
    self.origin.showsHorizontalScrollIndicator = show
    return self
  }
  @discardableResult
  func showsVerticalScrollIndicator(_ show: Bool) -> Chain {
    self.origin.showsVerticalScrollIndicator = show
    return self
  }
}
