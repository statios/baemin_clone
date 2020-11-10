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
  private let pickLabel = UILabel()
  let menus = ["사과", "바나나", "딸기", "초코", "아이스크림"]
  
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
        make.leading.equalTo(self.snp.centerX).offset(Padding.small)
        make.centerY.equalToSuperview()
      }
    
    pickLabel.asChainable()
      .font(Font.extraLarge.bold())
      .textAlignment(.right)
      .add(to: self)
      .makeConstraints { (make) in
        make.trailing.equalTo(self.snp.centerX).offset(-Padding.small)
        make.centerY.equalToSuperview()
      }
  }
  
  func setupBinding() {
    isAnimating
      .filter { !$0 }
      .subscribe(onNext: { [weak self] _ in
        self?.endRefreshing()
      }).disposed(by: disposeBag)
    
    contentOffset
      .map { $0.y }
      .filter { $0 < 0}
      .map { Int($0/15) }
      .distinctUntilChanged()
      .subscribe(onNext: { [weak self] _ in
        self?.pickLabel.text = self?.menus.randomElement()
      }).disposed(by: disposeBag)
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
