/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 4:01 PM
 */
package patterncraft.state {
    public class BarState implements IState {
        private var main:Main;
        public function BarState(main:Main) {
            this.main = main;
        }

        public function engage():void {
            main.sayBar()
        }
    }
}
