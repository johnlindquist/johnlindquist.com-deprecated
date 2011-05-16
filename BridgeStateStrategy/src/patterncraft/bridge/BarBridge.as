/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 3:58 PM
 */
package patterncraft.bridge {
    public class BarBridge implements IBridge{
        public function BarBridge() {
        }

        public function engage():void {
            trace("bar")
        }
    }
}
