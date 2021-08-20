//
//  AutoSlideBannerViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/08/11.
//

import UIKit

class AutoSlideBannerViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    //var slides : [Slide] = []
    var pageIndex: Int = 0
    var imgArray = [ UIImage(named: "yono4"),
                     UIImage(named: "yono2"),
                     UIImage(named: "yono3"),
                     UIImage(named: "yono") ]
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = imgArray.count
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        //let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoSlide), userInfo: nil, repeats: true)
        DispatchQueue.main.async {
            self.bannerTimer()
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }

    func bannerTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.autoSlide()
        }
    }
    
    func autoSlide() {
        
        if pageIndex < imgArray.count {
            print("pageIndex: \(pageIndex)")
            
            sliderCollectionView.scrollToItem(at: NSIndexPath(item: pageIndex, section: 0) as IndexPath, at: .centeredVertically, animated: true)
            pageControl.currentPage = pageIndex
            pageIndex += 1
        } else {
            pageIndex = 0
            print("pageIndex else: \(pageIndex)")
            //let index = IndexPath.init(item: pageIndex, section: 0)
            sliderCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .centeredVertically, animated: false)
            pageControl.currentPage = pageIndex
            pageIndex += 1
        }
//        if pageIndex == imgArray.count-1 {
//            sliderCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
//            pageIndex = 0
//            return
//        }
//        pageIndex += 1
//        sliderCollectionView.scrollToItem(at: NSIndexPath(item: pageIndex, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}

extension AutoSlideBannerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCell
        cell.imgView.image = imgArray[indexPath.row]
        return cell
    }
}

extension AutoSlideBannerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sliderCollectionView.frame.size.width, height: sliderCollectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageIndex = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
