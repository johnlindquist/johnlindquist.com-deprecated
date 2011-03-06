/**
 * User: John Lindquist
 * Date: 3/6/11
 * Time: 7:06 AM
 */
package com.johnlindquist.objectpool
{
	public interface IPooledObject
	{
		function sayHi():String;
		function dispose():void;
	}
}