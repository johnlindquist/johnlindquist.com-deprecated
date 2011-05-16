/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 4:05 PM
 */
package patterncraft.strategy {
    public class FooStrategy implements IStrategy{
        private var container:Container;
        public function FooStrategy(container:Container) {
            this.container = container;
        }

        public function engage():void {
            trace("foo") 
        }
    }
}
