using System.Globalization;

namespace Sunny_Hurghada.Models;

    public partial class Tour
    {
        public decimal DiscountedPrice
        {
            get
            {
                return AdultPrice - (Discount * AdultPrice / 100);
            }
        }
          public string TourLocalizedName
    {
        get
        {
            return TourLocalizeds.First().Name;
        }
    }
    public string LocalizedName
        {
            get
            {
            return TourLocalizeds.FirstOrDefault(tl => tl.LanguageId == CultureInfo.CurrentCulture.LCID)?.Name;
            }
        }
    public string MainPhotoUrl
    {
        get
        {
            return $"/img/tours/{MainPhoto}";
        }
    }
    public string DestinationName
    {
        get
        {
            return Destination.Name;
        }
    }
    public string TourTypeLocalizedName
    {
        get
        {
            return TourType.TourTypeLocalizeds.First().Name;
        }
    }
    public string Description
    {
        get
        {
            return TourLocalizeds.First().Description;
        }
    }
    public string Include
    {
        get
        {
            return TourLocalizeds.First().Includes;
        }
    }
    public string Exclude
    {
        get
        {
            return TourLocalizeds.First().Excludes;
        }
    }
    public string WhatToTake
    {
        get
        {
            return TourLocalizeds.First().WhatToBring;
        }
    }
}
