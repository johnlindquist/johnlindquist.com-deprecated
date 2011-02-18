/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 2:54 PM
 */
package characters
{
	public class NullMonster extends Monster
	{

		public function NullMonster(ascii:String, size:int)
		{
			super(ascii, size);
		}


		override public function accept(visitor:Allowable):void
		{
			visitor.allow();
		}
	}
}