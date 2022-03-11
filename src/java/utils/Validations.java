/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 *
 * @author QUANG HUY
 */
public class Validations {
      public static String convertDateToString(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        if (date == null) {
            return String.format("null", date);
        }
        return f.format(date);
    }

    public static Date convertStringToDate(String s) throws ParseException {
        DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String dateString = s;
        Date dateObject = (Date) sdf.parse(dateString);
        return dateObject;
    }
}
