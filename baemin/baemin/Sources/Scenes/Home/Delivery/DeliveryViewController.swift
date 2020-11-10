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
}

extension DeliveryViewController {
  override func setupUI() {
    super.setupUI()
    scrollView.asChainable()
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          .offset(BasePageViewController.Metric.pageBarHeight)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      }
    
    contentView.asChainable()
      .background(color: .red)
      .add(to: scrollView)
      .makeConstraints { (make) in
        make.top.bottom.width.equalToSuperview()
        make.height.equalTo(2500)
      }
    
    
    let refreshControl = UIRefreshControl()
    scrollView.addSubview(refreshControl)
    refreshControl.tintColor = .clear
    
    UIView().asChainable()
      .background(color: .darkGray)
      .clipToBounds(true)
      .add(to: refreshControl)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
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

