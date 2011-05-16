/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 4:05 PM
 */
package patterncraft.strategy {
    public class Container {
        public var engageBehavior:IStrategy;
        public function Container() {
        }

        public function engage():void {
            engageBehavior.engage();
        }
    }
}
