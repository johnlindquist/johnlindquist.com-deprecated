/**
 * User: John Lindquist
 * Date: Aug 24, 2010
 * Time: 11:32:51 PM
 */
package patterncraft.strategy
{
    public class Raven extends Vehicle
    {
        public function Raven()
        {
            graphics.beginFill(0x00cc00);
            graphics.drawRect(0, 0, 25, 25);
            graphics.endFill();
        }
    }
}