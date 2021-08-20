//
//  Swipe+PanViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/08/10.
//

import UIKit

class Swipe_PanViewController: UIViewController {
    
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var centerView: UIView!
    //let view1 = UIView()
    var slides: [UIView] = []
    var index: Int = 0
    var width: CGFloat?
    var height: CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        let safearea = view.safeAreaLayoutGuide.layoutFrame
        //mView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        //mView.frame = CGRect(x: 0, y: 0, width: view.frame.width * CGFloat(4), height: 300)
//        panView.addSubview(view1)
//        view1.translatesAutoresizingMaskIntoConstraints = false
//        view1.backgroundColor = .blue
//        view1.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true
//        view1.heightAnchor.constraint(equalTo: centerView.heightAnchor).isActive = true
//        view1.widthAnchor.constraint(equalTo: centerView.widthAnchor).isActive = true

        //mView.backgroundColor = .systemGray6
        
        width = CGFloat(panView.frame.width)
        height = CGFloat(panView.frame.height)
        let y = CGFloat(panView.frame.height - centerView.frame.height)/2
        print(width)
        print(height)
        print(y)
        slides = createSlides()
        for i in 0 ..< slides.count {
            panView.addSubview(slides[i])
            slides[i].translatesAutoresizingMaskIntoConstraints = false
            slides[i].frame = CGRect(x: 0, y: (panView.frame.height - centerView.frame.height)/2 - 90, width: panView.frame.width, height: centerView.frame.height)
            //slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 300)
        }
        panView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        slides.reverse()
        for i in 1 ..< slides.count {
            UIView.animate(withDuration: 0, animations: { self.slides[i].transform = CGAffineTransform(translationX: 0, y: 160) })
        }
    }
    
    func createSlides() -> [UIView] {
        let view1 = UIView()
        view1.backgroundColor = .blue
        let view2 = UIView()
        view2.backgroundColor = .yellow
        let view3 = UIView()
        view3.backgroundColor = .green
        let view4 = UIView()
        view4.backgroundColor = .orange
        let view5 = UIView()
        view5.backgroundColor = .purple

        return [view5, view4, view3, view2, view1]
    }

//    func createSlides() -> [Slide] {
//        let slide1 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide1.slide.backgroundColor = .blue
//
//        let slide2 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide2.slide.backgroundColor = .yellow
//
//        let slide3 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide3.slide.backgroundColor = .orange
//
//        let slide4 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide4.slide.backgroundColor = .green
//
//        return [slide1, slide2, slide3, slide4]
//    }

    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: panView)
        let width = CGFloat(width!)
        //print(width)
        switch gesture.state  {
        case .began:
            
            //print("began")
            break
        case .changed:

            slides[index].transform = CGAffineTransform(translationX: 0, y: translation.y)
            //print(translation.y)
            break
        case .ended:
            //UIView.animate(withDuration: 0.4, animations: { self.view1.transform = .identity })
            if translation.y < -30 && index < slides.count - 1 {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { self.slides[self.index].transform = CGAffineTransform(translationX: 0, y: -130) })
                index += 1
                panView.bringSubviewToFront(slides[index])
                UIView.animate(withDuration: 0.3, animations: { self.slides[self.index].transform = .identity })
            } else if translation.y >= 30 && index > 0 {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { self.slides[self.index].transform = CGAffineTransform(translationX: 0, y: 160) })
                index -= 1
                panView.bringSubviewToFront(slides[index])
                UIView.animate(withDuration: 0.3, animations: { self.slides[self.index].transform = .identity })
            } else {
                UIView.animate(withDuration: 0.3, animations: { self.slides[self.index].transform = .identity })
            }
            print(index)
            break
        default:
            break
        }
    }
   

}
