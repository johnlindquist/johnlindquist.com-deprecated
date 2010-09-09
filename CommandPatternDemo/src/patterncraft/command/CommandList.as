/**
 * User: John Lindquist
 * Date: Sep 8, 2010
 * Time: 10:56:53 PM
 */
package patterncraft.command
{
    public class CommandList
    {
        private var commands:Array = [];
        private var isBusy:Boolean = false;

        public function add(command:IAsyncCommand):void
        {
            command.addCompleteCallback(executeNext);
            commands.push(command);
            attemptExecute();
        }

        private function attemptExecute():void
        {
            if(!isBusy)
            {
                executeNext();
            }
        }

        private function executeNext():void
        {
            isBusy = false;
            if(commands.length > 0)
            {
                isBusy = true;
                var command:IAsyncCommand = commands.shift() as IAsyncCommand;
                command.execute();
            }
        }
    }
}