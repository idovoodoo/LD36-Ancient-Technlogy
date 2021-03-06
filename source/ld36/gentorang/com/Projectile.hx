package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author idovoodoo
 */
class Projectile extends FlxSprite
{
	//public vars
	
	//private vars
	private var speed:Float;
    private var direction:Int;
    private var damage:Float;
	private var resetTime:Float;
	private var fireType:Int;

	/**
	 * Constructor!!
	 * @param	X
	 * @param	Y
	 * @param	Speed
	 * @param	Direction
	 * @param	Damage
	 */
	public function new(X:Float, Y:Float, Speed:Float, Direction:Int, Damage:Float, ResetTime:Float, FireType:Int) 
	{
		super(X, Y);
		
		this.speed 		= Speed;
        this.direction	= Direction;
        this.damage 	= Damage;
		this.resetTime  = ResetTime;
		this.fireType	= FireType;
		
		switch (fireType) 
		{
			case 1:
				//place holder graphic
				this.makeGraphic(8, 8, FlxColor.BLACK);
			case 2:
				//place holder graphic
				this.makeGraphic(8, 8, FlxColor.PURPLE);
			case 3:
				//place holder graphic
				this.makeGraphic(8, 8, FlxColor.RED);
				
				
		}
		
	}
	
	/**
	 * Update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

        if (this.direction == FlxObject.LEFT){
            this.velocity.x = -speed;     
        }
        if (this.direction == FlxObject.RIGHT){
            this.velocity.x = speed;     
        }
        if (this.direction == FlxObject.FLOOR){
            this.velocity.y = speed;     
        }
        if (this.direction == FlxObject.CEILING){
            this.velocity.y = -speed;     
        }
	}
}