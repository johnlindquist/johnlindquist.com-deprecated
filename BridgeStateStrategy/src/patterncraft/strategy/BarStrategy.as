/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 4:05 PM
 */
package patterncraft.strategy {
    public class BarStrategy implements IStrategy{
        private var container:Container;
        public function BarStrategy(container:Container) {
            this.container = container;
        }

        public function engage():void {
            trace("bar") 
        }
    }
}
