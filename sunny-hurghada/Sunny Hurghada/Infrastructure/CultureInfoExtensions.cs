using System.Globalization;

namespace Sunny_Hurghada.Infrastructure
{
    public static class CultureInfoExtensions 
    {
        //create extension method for CultureInfo to get the language id
        public static int GetLanguageId(this CultureInfo cultureInfo)
        {
            // Assuming the language ID is the LCID (Locale Identifier)
            return cultureInfo.LCID;
        }

    }
}
