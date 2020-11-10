//
//  BaeminRefreshControl.swift
//  baemin
//
//  Created by Stat.So on 2020/11/10.
//

import UIKit
import RxSwift
import RxCocoa

class BaeminRefresh: UIRefreshControl {
  
  var disposeBag = DisposeBag()
  let isAnimating = PublishRelay<Bool>()
  let contentOffset = PublishRelay<CGPoint>()
  
  private let pullLabel = UILabel()
  private let scrollView = UIScrollView()
  
  override init() {
    super.init(frame: .zero)
    setupUI()
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    self.asChainable()
      .background(color: .clear)
      .tintColor(.clear)
      .clipToBounds(true)
    
    pullLabel.asChainable()
      .text("땡겨요")
      .font(Font.extraLarge.bold())
      .add(to: self)
      .makeConstraints { (make) in
        make.leading.equalTo(self.snp.centerX)
        make.centerY.equalToSuperview()
      }
    scrollView.asChainable()
      .add(to: self)
  }
  
  func setupBinding() {
    isAnimating
      .filter { !$0 }
      .subscribe(onNext: { [weak self] _ in
        self?.endRefreshing()
      }).disposed(by: disposeBag)
    
    contentOffset
      .subscribe()
      .disposed(by: disposeBag)
  }
}

extension BaeminRefresh {
  func set(to scrollView: UIScrollView) {
    let refreshing = scrollView.rx
      .didEndDecelerating
      .filter { self.isRefreshing }
      .share()
    
    refreshing
      .map { true }
      .do(onNext: { scrollView.isUserInteractionEnabled = !$0 })
      .bind(to: isAnimating)
      .disposed(by: disposeBag)
    
    refreshing
      .map { false }
      .delay(.seconds(2), scheduler: MainScheduler.instance)
      .do(onNext: { scrollView.isUserInteractionEnabled = !$0 })
      .bind(to: isAnimating)
      .disposed(by: disposeBag)
    
    scrollView.rx.contentOffset
      .bind(to: contentOffset)
      .disposed(by: disposeBag)
  }
}

extension Chain where Origin: BaeminRefresh {
  @discardableResult
  func set(target scrollView: UIScrollView) -> Chain {
    self.origin.set(to: scrollView)
    return self
  }
}
