//
//  DeliveryViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift
import Resolver

class DeliveryViewController: BaseViewController {
  @Injected var viewModel: DeliveryViewModel
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let refreshControl = BaeminRefresh()
}

extension DeliveryViewController {
  override func setupUI() {
    super.setupUI()
    scrollView.asChainable()
      .background(color: Color.gallery)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          .offset(BasePageViewController.Metric.pageBarHeight)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      }
    
    refreshControl.asChainable()
      .add(to: scrollView)
      .set(target: scrollView)
    
    contentView.asChainable()
      .background(color: .red)
      .add(to: scrollView)
      .makeConstraints { (make) in
        make.top.bottom.width.equalToSuperview()
        make.height.equalTo(2500)
      }
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    state.topBanners
      .drive()
      .disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //do error feedback
      }).disposed(by: disposeBag)
  }
}

