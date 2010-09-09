/**
 * User: John Lindquist
 * Date: Sep 8, 2010
 * Time: 10:22:50 PM
 */
package patterncraft.command
{
    import com.greensock.TweenMax;

    import flash.events.Event;

    public class MoveCommand extends AsyncCommand implements ICommand
    {
        private var scv:SCV;
        private var targetX:Number;
        private var targetY:Number;

        public function MoveCommand(scv:SCV, targetX:Number, targetY:Number)
        {
            this.scv = scv;
            this.targetX = targetX;
            this.targetY = targetY;
        }

        override public function execute():void
        {
            var moveTween:TweenMax = scv.move(targetX, targetY);
            moveTween.addEventListener(Event.COMPLETE, onComplete);
        }

        private function onComplete(event:Event):void
        {
            complete();
        }
    }
}