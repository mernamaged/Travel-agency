﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Sunny_Hurghada.Models;

public partial class Language
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<TourLocalized> TourLocalizeds { get; set; } = new List<TourLocalized>();

    public virtual ICollection<TourTypeLocalized> TourTypeLocalizeds { get; set; } = new List<TourTypeLocalized>();
}