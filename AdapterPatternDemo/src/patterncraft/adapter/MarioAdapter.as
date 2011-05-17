/**
 * User: John Lindquist
 * Date: 5/17/11
 * Time: 12:02 PM
 */
package patterncraft.adapter {
    import nintendo.Mario;

    public class MarioAdapter implements IUnit {
        private var mario:Mario = new Mario()
        public function MarioAdapter() {
        }

        public function attack():void {
            mario.jumpAttack();
        }
    }
}
