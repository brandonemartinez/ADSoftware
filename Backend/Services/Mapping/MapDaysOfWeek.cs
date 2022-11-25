using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Mapping
{
    public static class MapDaysOfWeek
    {
        public static string MapDaysOfWeekLanguage(string dayInEnglish)
        {
            //Method to map the days of the week in English to Spanish
            string dayInSpanish = "";
            switch (dayInEnglish)
            {
                case "Monday":
                    dayInSpanish = "Lunes";
                    break;
                case "Tuesday":
                    dayInSpanish = "Martes";
                    break;
                case "Wednesday":
                    dayInSpanish = "Miercoles";
                    break;
                case "Thursday":
                    dayInSpanish = "Jueves";
                    break;
                case "Friday":
                    dayInSpanish = "Viernes";
                    break;
                case "Saturday":
                    dayInSpanish = "Sabado";
                    break;
                case "Sunday":
                    dayInSpanish = "Domingo";
                    break;
            }
            return dayInSpanish;


        }
    }
}
