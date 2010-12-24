/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 12:01:57 PM
 */
package patterncraft.chain
{
    import com.greensock.TweenMax;

    import flash.display.Sprite;
    import flash.events.Event;

    public class Medivac extends Sprite
    {
        private var next:Medivac;
        private var isBusy:Boolean;
        private var marine:Marine;
        public function Medivac()
        {
            graphics.beginFill(0x0000cc);
            graphics.drawCircle(0, 0, 2);
            graphics.endFill();
        }

        public function add(medivac:Medivac):void
        {
            if(next == null)
            {
                next = medivac;
            }
            else
            {
                next.add(medivac);
            }
        }

        public function heal(marine:Marine):void
        {
            if(isBusy)
            {
                if(next != null)
                {
                    next.heal(marine);                
                }
            }
            else
            {
                this.marine = marine;
                isBusy = true;
                TweenMax.to(this, 1.5, {x:marine.x, y:marine.y + 5, bezierThrough:[{y:marine.y + 40}], onComplete:startHeal});
            }
        }

        private function startHeal():void
        {
            TweenMax.to(marine, marine.health * 5, {colorTransform:{tint:0xff0000, tintAmount:0}, health:1, onComplete:onHealComplete});
        }

        private function onHealComplete():void
        {
            isBusy = false;
        }
    }
}