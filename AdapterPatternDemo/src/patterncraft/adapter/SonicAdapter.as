/**
 * User: John Lindquist
 * Date: 5/17/11
 * Time: 12:04 PM
 */
package patterncraft.adapter {
    import sega.Sonic;

    public class SonicAdapter implements IUnit{
        private var sonic:Sonic = new Sonic();
        public function SonicAdapter() {
            
        }

        public function attack():void {
            sonic.spinAttack();
        }
    }
}
