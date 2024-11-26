import Image_Feed
import UIKit

final class ImagesListViewControllerSpy: ImagesListViewControllerProtocol {
    
    var presenter:ImagesListViewPresenterProtocol?
    var reloadDataCalled: Bool = false
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func reloadRow(at indexPath: IndexPath) { }
    func showErrorAlert(message: String) { }
    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) { }
}

