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
  
  struct Metric {
    static let imageSize = CGSize(width: 42, height: 42)
    static let xPosition = CGFloat(Device.width/2 - Metric.imageSize.width - Padding.small)
    static let imageOrigin = CGPoint(x: Metric.xPosition, y: 0)
    static let slideLength = CGFloat(42)
  }
  
  var disposeBag = DisposeBag()
  let deliveryCategories = DeliveryCategory.allCases
  
  private let pullLabel = UILabel()
  private let pickLabel = UILabel()
  private let pickImage = UIImageView()
  
  var scrollView: UIScrollView!
  
  override init() {
    super.init(frame: .zero)
    setupUI()
    //Must call a setupBinding() after set(_: UIScrollView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    self.asChainable()
      .background(color: .clear)
      .tintColor(.clear)
      .clipToBounds(true)
    
    pullLabel.asChainable()
      .text("땡겨요")
      .font(Font.extraLarge.bold())
      .color(Color.black)
      .add(to: self)
      .makeConstraints { (make) in
        make.leading.equalTo(self.snp.centerX)
        make.centerY.equalToSuperview()
      }
    
    pickLabel.asChainable()
      .font(Font.extraLarge.bold())
      .color(Color.black)
      .textAlignment(.right)
      .add(to: self)
      .makeConstraints { (make) in
        make.trailing.equalTo(self.snp.centerX).offset(-Padding.extraSmall)
        make.centerY.equalToSuperview()
      }
    
    pickImage.asChainable()
      .add(to: self)
      .frame(CGRect(origin: Metric.imageOrigin, size: Metric.imageSize))
  }
  
  private func setupBinding() {
    
    let animationStart = scrollView.rx.willBeginDecelerating.filter { [weak self] in self?.isRefreshing == true }
    let animationEnd = animationStart.delay(.milliseconds(2500), scheduler: MainScheduler.asyncInstance)
    
    animationStart
      .do(onNext: { [weak self] in self?.scrollView.isUserInteractionEnabled = false })
      .flatMap { Observable<Int>.interval(.milliseconds(100), scheduler: MainScheduler.asyncInstance).take(20) }
      .subscribe(onNext: { [weak self] in
        guard let `self` = self else { return }
        if $0 < 14 {
          self.pickImage.image = self.deliveryCategories.randomElement()?.image
          self.pickImage.frame.origin.y += Metric.slideLength
          UIView.animate(withDuration: 0.1) {
            self.pickImage.frame.origin.y -= Metric.slideLength
          }
        } else if $0 == 14 {
          self.pickImage.isHidden = true
          self.pickLabel.text = self.deliveryCategories.randomElement()?.title
          UIView.animate(withDuration: 0.3) {
            self.pickLabel.frame.origin.y -= Metric.slideLength
          }
        }
      }).disposed(by: disposeBag)
    
    animationEnd
      .do(onNext: { [weak self] in self?.scrollView.isUserInteractionEnabled = true })
      .subscribe(onNext: { [weak self] in
        self?.endRefreshing()
      }).disposed(by: disposeBag)


    let canSlideAnimate = Observable.merge(Observable.just(true),
                                           animationStart.map { false },
                                           scrollView.rx.didEndScrollingAnimation.map { true })
    let slideImage = scrollView.rx.contentOffset.map { $0.y }
      .withLatestFrom(canSlideAnimate) { ($0, $1) }
      .filter { $0.0 <= 0 && $0.1 }
      .map { Int($0.0/42) }
      .distinctUntilChanged()
      .withPrevious(startWith: 0)
    
    slideImage.map { $0 < $1 }
      .subscribe(onNext: { [weak self] in
        guard let `self` = self else { return }
        self.pickImage.image = self.deliveryCategories.randomElement()?.image
        let position: CGFloat = $0 ? -Metric.slideLength : Metric.slideLength
        UIView.animate(withDuration: 0.1) {
          self.pickImage.frame.origin.y += position
        }
      }).disposed(by: disposeBag)
    
    scrollView.rx.contentOffset
      .subscribe(onNext: { [weak self] _ in
        guard let `self` = self else { return }
        self.pickImage.frame.origin.y = -self.frame.midY - Metric.imageSize.width/2
      }).disposed(by: disposeBag)
    
    scrollView.rx.didEndScrollingAnimation
      .subscribe(onNext: { [weak self] in
        self?.pickImage.isHidden = false
        self?.pickLabel.text = nil
      }).disposed(by: disposeBag)
  }
}

extension BaeminRefresh {
  func set(to scrollView: UIScrollView) {
    self.scrollView = scrollView
    setupBinding()
  }
}

extension Chain where Origin: BaeminRefresh {
  @discardableResult
  func set(target scrollView: UIScrollView) -> Chain {
    self.origin.set(to: scrollView)
    return self
  }
}
