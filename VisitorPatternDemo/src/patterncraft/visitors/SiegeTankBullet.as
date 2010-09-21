/**
 * User: John Lindquist
 * Date: Sep 20, 2010
 * Time: 6:03:53 PM
 */
package patterncraft.visitors
{
    import flash.display.Sprite;

    import patterncraft.units.Armored;
    import patterncraft.units.Light;

    public class SiegeTankBullet extends Sprite implements IVisitor
    {
        public function SiegeTankBullet()
        {
            graphics.beginFill(0x000000);
            graphics.drawRect(-2, -2, 4, 4);
            graphics.endFill();
        }

        public function visitLight(light:Light):void
        {
            light.hitPoints -= 21;
        }

        public function visitArmored(armored:Armored):void
        {
            armored.hitPoints -= 34;
        }
    }
}