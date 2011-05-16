/**
 * User: John Lindquist
 * Date: 5/16/11
 * Time: 3:58 PM
 */
package patterncraft.bridge {
    public class FooBridge implements IBridge{
        public function FooBridge() {
        }

        public function engage():void {
            trace("foo")
        }
    }
}
