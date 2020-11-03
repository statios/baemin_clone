//
//  PageBar.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift
import RxCocoa

enum PageBarStyle {
  case fill
  case fit
}

class PageBar: BaseView {
  
  struct Metric {
    static let selectedBarHeight: CGFloat = 8
    static let selectedBarY: CGFloat = BasePageViewController.Metric.pageBarHeight - Metric.selectedBarHeight
  }
  
  let currentPage = BehaviorRelay<Int>(value: 0)
  
  var selectedBarView: UIView!
  var contentView: UIStackView!
  var pageBarItems = [PageBarItem]()

}

extension PageBar {
  override func setupUI() {
    super.setupUI()
    contentView = UIStackView()
      .asChainable()
      .background(color: Color.white)
      .axis(.horizontal)
      .distribution(.fillEqually)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }.origin
    selectedBarView = UIView()
      .asChainable()
      .background(color: .blue)
      .add(to: self)
      .origin
  }
  override func setupBinding() {
    super.setupBinding()
  }
}

extension PageBar {
  func setPageBarItems(_ viewControllers: [UIViewController]) {
    viewControllers
      .enumerated()
      .map { (offset, viewController) -> PageBarItem in
        let item = PageBarItem()
        item.title.accept(viewController.title)
        currentPage
          .distinctUntilChanged()
          .map { offset == $0 }
          .bind(to: item.isSelected)
          .disposed(by: disposeBag)
        pageBarItems.append(item)
        return item
      }
      .forEach { item in
        contentView.addArrangedSubview(item)
      }
    
    currentPage
      .subscribeOn(MainScheduler.asyncInstance)
      .subscribe(onNext: { [weak self] page in
        guard let `self` = self else { return }
        let leading = self.contentView.subviews[page].frame.origin.x
        let width = self.contentView.subviews[page].frame.width
        UIView.animate(withDuration: 0.2) {
          self.selectedBarView.frame = CGRect(x: leading,
                                              y:  Metric.selectedBarY,
                                              width: width,
                                              height: Metric.selectedBarHeight)
        }
      }).disposed(by: disposeBag)
  }
}
