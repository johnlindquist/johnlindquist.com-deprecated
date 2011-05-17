/**
 * User: John Lindquist
 * Date: 5/17/11
 * Time: 11:48 AM
 */
package patterncraft.adapter {
    public class Zealot implements IUnit {
        public function Zealot() {
        }

        public function attack():void {
            trace("Zealot slash attack")
        }
    }
}
