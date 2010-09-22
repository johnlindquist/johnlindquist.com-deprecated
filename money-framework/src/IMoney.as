/**
 * User: John Lindquist
 * Date: Sep 22, 2010
 * Time: 1:23:54 AM
 */
package
{
    import flash.display.DisplayObjectContainer;

    public interface IMoney
    {
        function get(id:String = null):*;
        function set(id:String = null, ...rest):void;
        function run(...rest):void;
        function remove():void;
        function watch(callback:Function, ...rest):void;
        function mediate(type:Class):DisplayObjectContainer;
    }
}