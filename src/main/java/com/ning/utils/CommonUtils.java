package com.ning.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ning on 15-12-20.
 */
public class CommonUtils {

    public static boolean isNumeric(String str){
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
    }

}
