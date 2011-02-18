/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 2:40 PM
 */
package characters
{
	public interface Visitable
	{
		function accept(visitor:Allowable):void;
	}
}