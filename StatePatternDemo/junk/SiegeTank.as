/**
 * User: John Lindquist
 * Date: Aug 26, 2010
 * Time: 3:17:22 AM
 */
package patterncraft.state
{
    import com.greensock.TweenMax;

    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.utils.setTimeout;

    public class SiegeTank extends Sprite
    {
        public var display:Sprite = new Sprite;
        public var damage:TextField = new TextField();
        public var range:TextField = new TextField();
        public var canMove:TextField = new TextField();
        
        public function SiegeTank()
        {
            display.graphics.beginFill(0x0000cc);
            display.graphics.drawRect(0, 0, 150, 75);
            display.graphics.endFill();

            damage.x = 160;
            range.x = 160;
            range.y = 25;
            canMove.x = 160;
            canMove.y = 50;
            
            addChild(display);
            addChild(damage);
            addChild(range);
            addChild(canMove);
        }

        public function toTankMode():void
        {
            damage.text = "damage = 10";
            range.text = "range = 10";
            canMove.text = "canMove = true";

            TweenMax.to(display, 1, {height:75, tint:0x0000cc});
        }

        public function toSiegeMode():void
        {
            damage.text = "damage = 20";
            range.text = "range = 20";
            canMove.text = "canMove = false";
            
            TweenMax.to(display, 1, {height:150, tint:0xcc0000});
        }

        public function toDominatorMode():void
        {
            damage.text = "damage = 40";
            range.text = "range = 40";
            canMove.text = "canMove = true";
            
            TweenMax.to(display, 1, {height:250, tint:0xff0000});

            setTimeout(toDisabledMode, 3000);
        }
        
        public function toDisabledMode():void
        {
            damage.text = "damage = 0";
            range.text = "range = 0";
            canMove.text = "canMove = false";
            
            TweenMax.to(display, 1, {height:75, tint:0xaaaaaa});

            setTimeout(toTankMode, 3000);
        }
    }
}