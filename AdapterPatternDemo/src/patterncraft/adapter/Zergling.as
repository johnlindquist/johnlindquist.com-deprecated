/**
 * User: John Lindquist
 * Date: 5/17/11
 * Time: 11:48 AM
 */
package patterncraft.adapter {
    public class Zergling implements IUnit {
        public function Zergling() {
        }

        public function attack():void {
            trace("Zergling clawing attack")
        }
    }
}
