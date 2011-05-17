/**
 * User: John Lindquist
 * Date: 5/17/11
 * Time: 11:48 AM
 */
package patterncraft.adapter {
    public class Marine implements IUnit {
        public function Marine() {
        }

        public function attack():void {
            trace("Marine firing guns")
        }
    }
}
