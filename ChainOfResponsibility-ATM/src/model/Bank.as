/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:29 AM
 */
package model
{
	public class Bank extends MoneyHolder
	{

		public function get hasMoney():Boolean
		{
			var flag:Boolean;
			flag ||= hundreds > 0;
			flag ||= twenties > 0;
			flag ||= tens > 0;
			flag ||= fives > 0;
			flag ||= ones > 0;
			
			if(!flag)
			{
				trace("The bank cannot fulfill your request");
			}
			
			return flag;
		}
	}
}