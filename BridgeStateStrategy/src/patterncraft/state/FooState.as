/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 4:01 PM
 */
package patterncraft.state {
    public class FooState implements IState {
        private var main:Main;
        public function FooState(main:Main) {
            this.main = main;
        }

        public function engage():void {
            main.sayFoo()
        }
    }
}
