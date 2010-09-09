/**
 * User: John Lindquist
 * Date: Sep 8, 2010
 * Time: 10:22:50 PM
 */
package patterncraft.command
{
    import com.greensock.TweenMax;

    import flash.events.Event;

    public class GatherCommand extends AsyncCommand implements ICommand
    {
        private var scv:SCV;

        public function GatherCommand(scv:SCV)
        {
            this.scv = scv;
        }

        override public function execute():void
        {
            var gatherTween:TweenMax = scv.gather();
            gatherTween.addEventListener(Event.COMPLETE, onComplete);
        }

        private function onComplete(event:Event):void
        {
            complete();
        }
    }
}