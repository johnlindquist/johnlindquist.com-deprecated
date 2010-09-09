/**
 * User: John Lindquist
 * Date: Sep 8, 2010
 * Time: 11:02:30 PM
 */
package patterncraft.command
{
    public class AsyncCommand implements IAsyncCommand
    {
        public var callback:Function;

        public function execute():void
        {
        }

        public function addCompleteCallback(callback:Function):void
        {
            this.callback = callback;
        }

        public function complete():void
        {
            callback.call();
        }
    }
}