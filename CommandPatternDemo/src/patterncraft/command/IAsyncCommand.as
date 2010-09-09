/**
 * User: John Lindquist
 * Date: Sep 9, 2010
 * Time: 1:14:34 AM
 */
package patterncraft.command
{
    public interface IAsyncCommand extends ICommand
    {
        function addCompleteCallback(callback:Function):void;
        function complete():void;
    }
}