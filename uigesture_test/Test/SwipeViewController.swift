//
//  SwipeViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/06/30.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var swipeView: UIView!
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var viewIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        let safearea = view.safeAreaLayoutGuide.layoutFrame
        let width:CGFloat = safearea.width
        let height:CGFloat = swipeView.bounds.size.height
        
        swipeView.addSubview(view3)
        swipeView.addSubview(view2)
        swipeView.addSubview(view1)
        swipeView.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
//            view.leadingAnchor.constraint(equalTo: swipeView.trailingAnchor).isActive = true
//            view.heightAnchor.constraint(equalTo: swipeView.heightAnchor).isActive = true
//            view.widthAnchor.constraint(equalTo: swipeView.widthAnchor).isActive = true
            //view.widthAnchor.constraint(equalTo: view1.heightAnchor).isActive = true
        }
        view1.centerXAnchor.constraint(equalTo: swipeView.centerXAnchor).isActive = true
        view1.heightAnchor.constraint(equalTo: swipeView.heightAnchor).isActive = true
        view1.widthAnchor.constraint(equalTo: swipeView.widthAnchor).isActive = true
        view1.backgroundColor = .blue
        view2.backgroundColor = .orange
        //view1.frame = CGRect(x: 0, y: 0, width: height, height: height)
        //view2.frame = CGRect(x: view.bounds.width/2, y: 0, width: swipeView.frame.height, height: swipeView.frame.height)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        swipeView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        swipeView.addGestureRecognizer(swipeLeft)
        

    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            print("swipeRight")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: { self.view1.transform = CGAffineTransform(translationX: 100, y: 0) })
            break
        case .left:
            print("swipeLeft")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: { self.view1.transform = CGAffineTransform(translationX: -100, y: 0) })
            break
        default:
            break
        }
    }


}

