/**
 * User: John Lindquist
 * Date: 3/6/11
 * Time: 7:07 AM
 */
package com.johnlindquist.objectpool
{
	//a global var with a reference to a "function constructor" (foo).
	//you can only use "new" on a function when it's an inner function (like outside this package)
	public const SomeObject = foo;
}

//everything below is standard pooling stuff
import com.johnlindquist.objectpool.IPooledObject;

var pool:Array = new Array(new PooledObject("1"),new PooledObject("2"),new PooledObject("3"));
var nullPooledObject:NullPooledObject = new NullPooledObject("null");
function foo():IPooledObject
{
	if(pool.length > 0)
	{
		return pool.shift();
	}
	else
	{
		return nullPooledObject;
	}
	
}

class PooledObject implements IPooledObject
{
	private var id:String;
	public function PooledObject(id:String)
	{
		this.id = id;
	}

	public function sayHi():String
	{
		return "Hello, I'm #" + id;
	}

	//dispose is an api through the instance that let's you put it back in the pool ;)
	public function dispose():void
	{
		pool.push(this);
	}
}

//everyone loves null objects
class NullPooledObject extends PooledObject implements IPooledObject
{
	function NullPooledObject(id:String)
	{
		super(id);
	}

	override public function sayHi():String
	{
		return "Sorry, the pool was empty...";
	}

	override public function dispose():void
	{
		//do nothing
	}
}
