/**
 * Created by IntelliJ IDEA.
 * User: John Lindquist
 * Date: Aug 18, 2010
 * Time: 4:23:44 AM
 * To change this template use File | Settings | File Templates.
 */
package patterncraft.units
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;

    import patterncraft.visitors.IVisitor;

    public class Armored extends Sprite implements IInfantry
    {
        protected var hitPointsDisplay:TextField = new TextField();
        
        protected var _hitPoints:Number = 125;
        public function get hitPoints():Number
        {
            return _hitPoints;
        }

        public function set hitPoints(value:Number):void
        {
            _hitPoints = value;
            updateHitPointsDisplay();
        }

        private function updateHitPointsDisplay():void
        {
            hitPointsDisplay.text = hitPoints + "/" + maxHitPoints;
        }
        
        public function Armored()
        {
            graphics.beginFill(0x00cc00);
            graphics.drawRect(-10, -10, 20, 20);
            graphics.endFill();
            
            hitPointsDisplay.autoSize = TextFieldAutoSize.LEFT;
            addChild(hitPointsDisplay);
            
            updateHitPointsDisplay();
        }

        public function get maxHitPoints():Number
        {
            return 125;
        }

        public function accept(bullet:IVisitor):void
        {
            bullet.visitArmored(this);
        }
    }
}