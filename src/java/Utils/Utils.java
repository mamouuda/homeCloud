/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author mouadh
 */
public class Utils {
    
    public static String resolveImageName(String name){
        
        if (name.startsWith("Shutter")){
            return "Shutter.jpg";
        }
        else
        if (name.startsWith("bathroom")){
            return "bathroom.jpg";
        }
        else
        if (name.startsWith("bedroom")){
            return "bedroom.jpg";
        }
        else
        if (name.startsWith("camera")){
            return "camera.jpg";
        }
        else
        if (name.startsWith("kitchen")){
            return "kitchen.jpg";
        }
        else
        if (name.startsWith("LightSwitch")){
            return "lightSwitch.jpg";
        }
        else
        if (name.startsWith("livingroom")){
            return "livingroom.jpg";
        }
        else
        return "";
    }
    
}
