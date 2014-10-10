﻿package {	import flash.display.*;	import flash.events.*;	import caurina.transitions.Tweener;		public class Content_Manager3 {		private var host_mc:MovieClip;		public var current_content:MovieClip;		private var old_content:Array;		private var open_tween:Object;	// Object to hold the tween that introduce a new clip		private var close_tween:Object;	// Object to hold tween that exits a clip		private var starting_values:Object;				public function Content_Manager3( _mc:MovieClip, o_tween:Object, c_tween:Object, start_obj:Object ) {			host_mc = _mc;			old_content = new Array();			open_tween = o_tween;								close_tween = c_tween;			close_tween.onComplete = remove_content;	// Make sure to add the onComplete call to remove_content						starting_values = start_obj;		}				public function set_open_tween( _obj:Object ):void {			open_tween = _obj;		}				public function set_close_tween( _obj:Object ):void {			close_tween = _obj;		}				public function set_start_obj( _obj:Object ):void {			starting_values = _obj;		}				public function add_content( id ):MovieClip {			if ( current_content != null ) {				Tweener.addTween( current_content, close_tween ); 				old_content.push( current_content );			} 						current_content = new id();						for ( var p in starting_values ) {				current_content[ p ] = starting_values[ p ];			}					Tweener.addTween( current_content, open_tween );			host_mc.addChild( current_content );			return current_content;		}				private function remove_content():void {			try { 				// old_content[0].destroy();			} catch ( e:ArgumentError ) {				trace( "***" + e );			}			// trace( "******" + old_content[0].destroy );			/*if ( old_content[0].destroy != undefined ) {				// old_content[0].destroy();			}*/			host_mc.removeChild( old_content[0] );			old_content.splice( 0, 1 );		}	}}