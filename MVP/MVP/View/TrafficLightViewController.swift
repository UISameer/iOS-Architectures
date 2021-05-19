import UIKit

class TrafficLightViewController: UIViewController {
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    @IBAction func actionRed(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Red")
    }
    
    @IBAction func actionYellow(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Yellow")
    }
    
    @IBAction func actionGreen(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Green")
    }
}

extension TrafficLightViewController: TrafficLightViewDelegate {
    func displayTrafficLight(description: (String)) {
        self.lblDescription.text = description
    }
}
