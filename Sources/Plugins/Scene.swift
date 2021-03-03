import Foundation

public class Scene: Plugin {

    public override func onDestroy() {
        super.onDestroy()
        print(#function)
    }
}
