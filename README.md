
# Outline System

Maintainer: Sidorakh

A  system supporting constant outlines a-la Overwatch and Team Fortress 2. Created for an upcoming space tactics game by [Faux-Operative Games](http://fauxoperativegames.com/)

![Picture of the project or a logo](https://i.imgur.com/iFrQQuw.png)

[The system in action](https://lithi.io/file/9140.mp4)



Usage is simple - ensure that `obj_outliner` exists in the room where you need outlines, and call `scr_add_outline` for each sprite you want to outline. These outlines are drawn on the GUI layer so they're consistent with any zooming in or out the camera may do. 

If you're only looking for a basic outline shader implementation, then you'll want to take a look at `obj_basic_outline`, which contains a basic implementation of the outline shader without the overhead of the fancy system. 


Credits
 - [Robert Turpin]( https://thisnorthernboy.blog/) and [Breno Girafa](https://www.artstation.com/breno_girafa) for the spaceship sprites. Provided for demonstration purposes only, you cannot use these sprites in your own projects. 
