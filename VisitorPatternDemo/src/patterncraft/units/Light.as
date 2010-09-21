/**
 * Created by IntelliJ IDEA.
 * User: John Lindquist
 * Date: Aug 18, 2010
 * Time: 4:24:29 AM
 * To change this template use File | Settings | File Templates.
 */
package patterncraft.units
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;

    import patterncraft.visitors.IVisitor;

    public class Light extends Sprite implements IInfantry
    {
        protected var hitPointsDisplay:TextField = new TextField();

        protected var _hitPoints:Number = 45;
        public function get hitPoints():Number
        {
            return _hitPoints;
        }

        public function set hitPoints(value:Number):void
        {
            _hitPoints = value;
            updateHitPointsDisplay();
        }

        public function get maxHitPoints():Number
        {
            return 45;
        }

        public function Light()
        {
            graphics.beginFill(0xcc0000);
            graphics.drawCircle(0, 0, 10);
            graphics.endFill();

            hitPointsDisplay.autoSize = TextFieldAutoSize.LEFT;
            
            addChild(hitPointsDisplay);
            updateHitPointsDisplay();
        }

        private function updateHitPointsDisplay():void
        {
            hitPointsDisplay.text = hitPoints + "/" + maxHitPoints;
        }

        public function accept(bullet:IVisitor):void
        {
            bullet.visitLight(this);
        }
    }
}