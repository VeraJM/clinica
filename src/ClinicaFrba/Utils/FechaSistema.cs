using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace ClinicaFrba.Utils
{
    class FechaSistema
    {
        public static DateTime getFechaActual()
        {
            return DateTime.ParseExact(System.Configuration.ConfigurationSettings.AppSettings["FechaSistema"], "yyyy-MM-dd HH:mm:ss",
                                       System.Globalization.CultureInfo.InvariantCulture);
        }

        public static int getAnio()
        {
            return FechaSistema.getFechaActual().Year;
        }

        public static int getMes()
        {
            return FechaSistema.getFechaActual().Month;
        }

        public static int getDia()
        {
            return FechaSistema.getFechaActual().Day;
        }
    }
}
